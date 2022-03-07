######################################################################
### confluent kafka
######################################################################

### topic

### create
./kafka-topics \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --create \
    --partitions 3 \
    --replication-factor 1 \
    --topic my-topic
./kafka-topics \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --create \
    --partitions 3 \
    --replication-factor 3 \
    --topic my-topic

### delete
./kafka-topics \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --delete \
    --topic my-topic
./kafka-topics \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --delete \
    --topic my-topic

### topic list
./kafka-topics \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --list
./kafka-topics \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --list

### describe
./kafka-topics \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --describe \
    --topic my-topic
./kafka-topics \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --describe \
    --topic my-topic
./kafka-configs \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --entity-type topics \
    --entity-name my-topic \
    --describe \
    --all

######################################################################

### add config
./kafka-configs \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --entity-type topics \
    --entity-name my-topic \
    --alter \
    --add-config retention.ms=1000
