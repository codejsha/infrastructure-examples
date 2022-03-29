######################################################################

hadoop version
hdfs version

######################################################################

### hdfs

### list
hdfs dfs -ls /
hdfs dfs -ls hdfs://namenode01.example.com/

### disk usage
hdfs dfs -du -s -h hdfs://namenode01.example.com/

### put
hdfs dfs -put -f /path/to/file.parquet /kafka-source-storage/sample-dataset1
hdfs dfs -put -f ~/boston-311-svc-req-2022.parquet /kafka-source-storage/boston-safety

### delete (recursively)
hdfs dfs -rm -r -f -skipTrash hdfs://namenode01.example.com/logs/*
