######################################################################
### confluent kafka
######################################################################

### describe topic
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type topics \
    --entity-name my-topic \
    --describe
### describe topic (sasl)
./kafka-configs \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --entity-type topics \
    --entity-name my-topic \
    --describe

### describe brokers
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type brokers \
    --describe \
    --all
### describe brokers (sasl)
./kafka-configs \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --entity-type brokers \
    --describe \
    --all

### describe users
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type users \
    --describe \
    --all
### describe users (sasl)
./kafka-configs \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --entity-type users \
    --describe \
    --all

######################################################################

### create credentials
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=client-secret]" --entity-type users --entity-name client
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=kafkaadmin]" --entity-type users --entity-name kafkaadmin
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=kafka-secret]" --entity-type users --entity-name kafka
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=schema-registry-secret]" --entity-type users --entity-name schema-registry
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=kafka-connect-secret]" --entity-type users --entity-name kafka-connect
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=ksqldb-secret]" --entity-type users --entity-name ksqldb
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=kafka-rest-secret]" --entity-type users --entity-name kafka-rest
./kafka-configs --bootstrap-server localhost:9092 --alter --add-config "SCRAM-SHA-512=[iterations=4096,password=control-center-secret]" --entity-type users --entity-name control-center
./kafka-configs --bootstrap-server localhost:9092 --entity-type users --describe --all

######################################################################

### quota

kafka-configs --bootstrap-server localhost:9092 --entity-type clients --describe --all

kafka-configs --bootstrap-server localhost:9092 --alter --add-config "producer_byte_rate=153600,consumer_byte_rate=153600" --entity-type clients --entity-default
kafka-configs --bootstrap-server localhost:9092 --alter --add-config "producer_byte_rate=102400,consumer_byte_rate=102400" --entity-name my-producer-1 --entity-type clients

kafka-configs --bootstrap-server localhost:9092 --alter --delete-config producer_byte_rate,consumer_byte_rate --entity-type clients
kafka-configs --bootstrap-server localhost:9092 --alter --delete-config producer_byte_rate,consumer_byte_rate --entity-name my-producer-1 --entity-type clients
