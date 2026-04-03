ls
pwd
lsb_release -a
wsl --list --verbose
sudo apt update
sudo apt install openjdk-11-jdk -y
java -version
cd ~
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
tar -xvzf hadoop-3.3.6.tar.gz
mv hadoop-3.3.6 hadoop
ls
nano ~/.bashrc
hadoop version
nano ~/.bashrc
source ~/.bashrcsource ~/.bashrc
source ~/.bashrc
hadoop version
exit
exist
exit
nano $HADOOP_HOME/etc/hadoop/core-site.xml
nano $HADOOP_HOME/etc/hadoop/hdfs-site.xml
mkdir -p ~/hadoop_data/namenode
mkdir -p ~/hadoop_data/datanode
hdfs namenode -format
start-dfs.sh
sudo apt update
sudo apt install openssh-server -y
sudo service ssh start
ssh localhost
start-dfs.sh
jps
ssh-keygen -t rsa -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh localhost
start-dfs.sh
jps
readlink -f $(which java)
nano $HADOOP_HOME/etc/hadoop/hadoop-env.sh
source ~/.bashrc
start-dfs.sh
jps
hdfs dfs -ls /
hdfs dfs -mkdir /data
hdfs dfs -mkdir /data/raw
hdfs dfs -mkdir /data/processed
hdfs dfs -ls /data
ls
pwd
cd /mnt/c/Users/zineb123
cd /mnt/c/Users
ls
cd /mnt/c/Users/zineb
ls
cd DEsktop
ls
cd /mnt/c/Users/zineb/Downloads
ls
ls Customers.csv
hdfs dfs -put /mnt/c/Users/zineb/Downloads/Customers.csv /data/raw/
cd ..
cd.
cd..
java -version
cd ~/hadoop
sbin/start-dfs.sh
jps
hdfs dfs -put /mnt/c/Users/zineb/Downloads/data.csv /data/raw/
ls /mnt/c/Users/zineb/Downloads
hdfs dfs -put /mnt/c/Users/zineb/Desktop/Interactions.csv /data/raw/
ls /mnt/c/Users/zineb
find /mnt/c/Users/zineb -name "Interactions.csv"
hdfs dfs -put /mnt/c/Users/zineb/Downloads/Interactions.csv 
hdfs dfs -put /mnt/c/Users/zineb/Downloads/Interactions.csv /data/raw/
hdfs dfs -ls /data/raw
hdfs dfs -put /mnt/c/Users/zineb/Downloads/Customers.csv /data/raw/
hdfs dfs -put /mnt/c/Users/zineb/Downloads/Transactions.csv /data/raw/
hdfs dfs -put /mnt/c/Users/zineb/Downloads/ChurnPrediction.csv /data/raw/
hdfs dfs -ls /data/raw
cd mnt/c
ls
cd /mnt/cd
cs /mnt/c
cd /mnt/c
ls
cd..
cd .
lsb_release -a
cd ..
wsl -l -v
wsl -l -v
hdfs dfs -cat /data/raw/Interactions.csv
start-dfs.sh
hdfs dfs -cat /data/raw/Interactions.csv
hdfs dfs -head /data/raw/Interactions.csv
pyspark
pip install pyspark
sudo apt update
sudo apt install python3-pip -y
pyspark
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*
sudo apt update
sudo apt install python3-pip --fix-missing -y
pip version
pip3 --version
pip3 install pyspark
pip install pyspark
start-dfs.sh
pyspark
pip3 --version
pip3 install pyspark
sudo apt install python3-venv -y
python3 -m venv pyspark_env
source pyspark_env/bin/activate
pip install pyspark
pyspark
deactivate
sudo apt install openjdk-17-jdk -y
sudo update-alternatives --config java
java -version
source pyspark_env/bin/activate
pyspark
echo $JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
desactivate
deactivate
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
source pyspark_env/bin/activate
export PATH=$JAVA_HOME/bin:$PATH
echo $JAVA_HOME
pyspark
start-dfs.sh
source pyspark_env/bin/activate
df = spark.read.csv("hdfs:///data/raw/data.csv", header=True, inferSchema=True)
df.show()
start-dfs.sh
jps
source pyspark_env/bin/activate
pyspark
deactivate
nano ~/.bashrc
source ~/.bashrc
java -version
source pyspark_env/bin/activate
pyspark
hdfs dfs -ls /data/raw/
pwd
df = spark.read.csv("hdfs://localhost:9000/data/raw/Interactions.csv", header=True, inferSchema=True)
df.show() pyspark
pyspark
