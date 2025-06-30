######################################################################

function cdhadoop() { DIRECTORY="/usr/local/hadoop"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }

######################################################################

### install hadoop

### homebrew
brew install hadoop

### chocolatey
choco install -y hadoop
choco install -y hadoop -params "/unzipLocation:$env:USERPROFILE\portable"

######################################################################

hadoop version

######################################################################

### hdfs

hdfs version

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
