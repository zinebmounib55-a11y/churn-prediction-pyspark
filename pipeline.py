import pandas as pd
from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.ml.feature import StringIndexer, VectorAssembler
from pyspark.ml.classification import RandomForestClassifier
from pyspark.ml.evaluation import MulticlassClassificationEvaluator

spark = SparkSession.builder.appName("ChurnPredictionPipeline").getOrCreate()

# Chargement
df_interactions = spark.read.csv("hdfs://localhost:9000/data/raw/Interactions.csv", header=True, inferSchema=True)
df_customers    = spark.read.csv("hdfs://localhost:9000/data/raw/Customers.csv",    header=True, inferSchema=True)
df_transactions = spark.read.csv("hdfs://localhost:9000/data/raw/Transactions.csv", header=True, inferSchema=True)
df_churn        = spark.read.csv("hdfs://localhost:9000/data/raw/ChurnPrediction.csv", header=True, inferSchema=True)

# ✅ Agrégation des transactions AVANT jointure (évite la duplication)
df_transactions_agg = df_transactions.groupBy("CustomerID").agg(
    F.sum("Amount").alias("TotalAmount"),
    F.count("TransactionID").alias("NbTransactions"),
    F.avg("Amount").alias("AvgAmount")
)

# Jointure propre (1 ligne par client)
df_full = df_interactions \
    .join(df_customers,        on="CustomerID") \
    .join(df_transactions_agg, on="CustomerID") \
    .join(df_churn,            on="CustomerID")

print("=== Données jointes ===")
df_full.show(5)
print("Nombre de lignes :", df_full.count())

# Préparation ML
label_indexer = StringIndexer(inputCol="RiskLevel", outputCol="label")
df_ml = label_indexer.fit(df_full).transform(df_full)

categorical_cols = ["Gender", "Region", "ContractType", "Type"]
for col in categorical_cols:
    indexer = StringIndexer(inputCol=col, outputCol=col + "_index")
    df_ml = indexer.fit(df_ml).transform(df_ml)

# ✅ Features enrichies avec TotalAmount, NbTransactions, ChurnProbability
features = [
    "Age", "Income", "InternetUsage",
    "Sentiment", "ResponseTime",
    "TotalAmount", "NbTransactions", "AvgAmount",
    "ChurnProbability",
    "Gender_index", "Region_index",
    "ContractType_index", "Type_index"
]

assembler = VectorAssembler(inputCols=features, outputCol="features")
df_ml = assembler.transform(df_ml)

# Train / Test
train, test = df_ml.randomSplit([0.8, 0.2], seed=42)

# Modèle avec plus d'arbres
rf = RandomForestClassifier(labelCol="label", featuresCol="features", numTrees=100)
model = rf.fit(train)

# Prédictions
predictions = model.transform(test)
print("=== Prédictions ===")
predictions.select("CustomerID", "RiskLevel", "prediction").show(10)

# Évaluation
evaluator = MulticlassClassificationEvaluator(
    labelCol="label", predictionCol="prediction", metricName="accuracy"
)
print("=== Accuracy ===")
print(evaluator.evaluate(predictions))

# Importance des features
print("=== Importance des features ===")
for i, imp in enumerate(model.featureImportances):
    print(f"  {features[i]:<25} : {imp:.4f}")

# ==============================
# 11. VISUALISATION
# ==============================

import matplotlib.pyplot as plt

# Convertir en pandas (petit échantillon)
pdf = predictions.select("RiskLevel", "prediction", "Sentiment", "ResponseTime").toPandas()

# ------------------------------
# 1. Distribution des RiskLevel
# ------------------------------
pdf["RiskLevel"].value_counts().plot(kind='bar')
plt.title("Distribution des niveaux de risque")
plt.xlabel("RiskLevel")
plt.ylabel("Nombre")
plt.savefig("risk_distribution.png")
plt.clf()

# ------------------------------
# 2. Comparaison prédiction vs réel
# ------------------------------
pd.crosstab(pdf["RiskLevel"], pdf["prediction"]).plot(kind='bar')
plt.title("Comparaison Réel vs Prédiction")
plt.savefig("prediction_vs_real.png")
plt.clf()

# ------------------------------
# 3. Sentiment vs Risk
# ------------------------------
pdf.boxplot(column="Sentiment", by="RiskLevel")
plt.title("Sentiment par niveau de risque")
plt.savefig("sentiment_vs_risk.png")
plt.clf()

# ------------------------------
# 4. ResponseTime vs Risk
# ------------------------------
pdf.boxplot(column="ResponseTime", by="RiskLevel")
plt.title("Temps de réponse par risque")
plt.savefig("response_vs_risk.png")
plt.clf()

print("=== Graphiques sauvegardés ===")
spark.stop()
