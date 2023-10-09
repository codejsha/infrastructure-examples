# Initialize Hive

Apache Hive 2.1.1, Apache Hadoop 2.9.2

## Set Filesystem

```bash
cd /usr/local/hadoop-2.9.2/bin
./hdfs dfs -mkdir /tmp
./hdfs dfs -mkdir /tmp/hive
./hdfs dfs -mkdir /user
./hdfs dfs -mkdir /user/hive/
./hdfs dfs -mkdir /user/hive/warehouse
./hdfs dfs -chmod g+w /tmp
./hdfs dfs -chmod g+w /user/hive/warehouse
./hdfs dfs -chmod 777 /tmp/hive
```

## Initialize if Metastore is MySQL

```bash
cd /usr/local/apache-hive-2.1.1-bin
./bin/schematool -initSchema -dbType mysql
# Metastore connection URL:	 jdbc:mysql://realforce22:3306/hivemetastore
# Metastore Connection Driver :	 com.mysql.jdbc.Driver
# Metastore connection User:	 prouser
# Starting metastore schema initialization to 2.1.0
# Initialization script hive-schema-2.1.0.mysql.sql
# Initialization script completed
# schemaTool completed
```

## Initialize if Metastore is Derby

```bash
cd /usr/local/apache-hive-2.1.1-bin/bin
./schematool -initSchema -dbType derby
# Metastore connection URL:	 jdbc:derby:;databaseName=metastore_db;create=true
# Metastore Connection Driver :	 org.apache.derby.jdbc.EmbeddedDriver
# Metastore connection User:	 APP
# Starting metastore schema initialization to 2.1.0
# Initialization script hive-schema-2.1.0.derby.sql
# Initialization script completed
# schemaTool completed
```

## Run

```bash
cd /usr/local/apache-hive-2.1.1-bin/bin
./hive
```

```txt
hive> SHOW DATABASES;
### Result:
# default
```

## Metastore

```bash
cd /usr/local/apache-hive-2.1.1-bin/bin
./hive --service metastore
```

## HiveServer2

```bash
cd /usr/local/apache-hive-2.1.1-bin
./bin/hive --service hiveserver2
```

### Beeline

```bash
cd /usr/local/apache-hive-2.1.1-bin
./bin/beeline -u jdbc:hive2://namenode1:10000/default -n prouser -p 1234
```
