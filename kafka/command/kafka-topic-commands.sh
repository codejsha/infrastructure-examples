######################################################################
### apache kafka
######################################################################

### create topic

kafka-topics.sh \
    --bootstrap-server localhost:9092 \
    --create \
    --partitions 3 \
    --replication-factor 1 \
    --topic my.topic

alias dce="docker compose exec"
dce kafka-client kafka-topics.sh --bootstrap-server kafka-broker:9092 --create --partitions 3 --replication-factor 1 --topic my.topic

### delete topic

kafka-topics.sh \
    --bootstrap-server localhost:9092 \
    --delete \
    --topic my.topic

dce kafka-client kafka-topics.sh --bootstrap-server kafka-broker:9092 --delete --topic my.topic

### topic list

kafka-topics.sh \
    --bootstrap-server localhost:9092 \
    --list

dce kafka-client kafka-topics.sh --bootstrap-server kafka-broker:9092 --list

docker run --rm -it \
    --network stream-network \
    --env KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper1:2181,zookeeper2:2181,zookeeper3:2181/clusterlocal \
    bitnami/kafka:latest \
    kafka-topics.sh --bootstrap-server localhost:9092 --list

### describe topic

kafka-topics.sh \
    --bootstrap-server localhost:9092 \
    --describe \
    --topic my.topic

dce kafka-client kafka-topics.sh --bootstrap-server kafka-broker:9092 --describe --topic my.topic

######################################################################

### delete topic data
cat <<EOF > ./delete-records.json
{
  "partitions": [
    {
      "topic": "my.topic",
      "partition": 0,
      "offset": 0
    }
  ],
  "version": 1
}
EOF
kafka-delete-records.sh \
    --bootstrap-server localhost:9092 \
    --offset-json-file delete-records.json

######################################################################

### dump log
kafka-dump-log.sh \
    --print-data-log \
    --files /data/kafka/my.topic-0/00000000000000000000.log
