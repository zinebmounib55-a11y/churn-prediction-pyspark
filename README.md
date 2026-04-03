# 🚀 Churn Prediction with PySpark

## 📊 Project Overview

This project focuses on predicting customer churn using **PySpark**.
The goal is to analyze customer behavior, interactions, and transactions to identify customers at risk of leaving.

---

## 🧩 Dataset Description

The project uses multiple datasets:

* **Customers** → demographic and subscription data
* **Transactions** → purchase history
* **Interactions** → customer service interactions (sentiment, response time)
* **ChurnPrediction** → churn probability and risk level

---

## ⚙️ Data Pipeline

### 1. Data Ingestion

* Data stored in **HDFS**
* Loaded using PySpark

### 2. Data Processing

* Cleaning and formatting data
* Handling missing values
* Feature selection

### 3. Data Integration

* Joining multiple datasets using `CustomerID`

### 4. Feature Engineering

* Sentiment analysis
* Aggregations (average sentiment, response time, etc.)

---

## 🤖 Machine Learning Model

* Model used: **Random Forest Classifier**
* Target: **RiskLevel (Churn Risk)**
* Steps:

  * Encoding categorical variables
  * Feature vector creation
  * Model training and prediction

---

## 📈 Results & Insights

* Distribution of churn risk levels
* Impact of sentiment on churn
* Customer behavior patterns

---

## 📊 Visualizations

The project includes:

* Risk distribution chart
* Sentiment vs churn
* Response time vs churn
* Predictions vs actual values

---

## 🛠️ Technologies Used

* Python
* PySpark
* Hadoop (HDFS)
* Matplotlib

---

## 🚀 How to Run

```bash
pip install pyspark matplotlib
python pipeline.py
```

---

## 👩‍💻 Author

**Zineb**
Aspiring Data Engineer / Data Scientist

---

## 💡 Key Takeaways

* Built a complete **Big Data pipeline**
* Performed **data analysis and feature engineering**
* Implemented a **machine learning model**
* Generated **actionable business insights**

---

