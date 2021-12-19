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
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type topics \
    --entity-name my-topic \
    --describe \
    --command-config /usr/local/confluent/properties/client.properties

### describe brokers
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type brokers \
    --describe \
    --all
### describe brokers (sasl)
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type brokers \
    --describe \
    --all \
    --command-config /usr/local/confluent/properties/client.properties

### describe users
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type users \
    --describe \
    --all
### describe users (sasl)
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type users \
    --describe \
    --all \
    --command-config /usr/local/confluent/properties/client.properties

######################################################################

### create credentials
./kafka-configs --bootstrap-server localhost:9095 --alter --add-config 'SCRAM-SHA-256=[iterations=8192,password=kafkaadmin],SCRAM-SHA-512=[iterations=8192,password=kafkaadmin]' --entity-type users --entity-name kafkaadmin
./kafka-configs --bootstrap-server localhost:9095 --alter --add-config 'SCRAM-SHA-256=[iterations=8192,password=kafka-secret],SCRAM-SHA-512=[iterations=8192,password=kafka-secret]' --entity-type users --entity-name kafka
./kafka-configs --bootstrap-server localhost:9095 --alter --add-config 'SCRAM-SHA-256=[iterations=8192,password=sr-secret],SCRAM-SHA-512=[iterations=8192,password=sr-secret]' --entity-type users --entity-name sr
./kafka-configs --bootstrap-server localhost:9095 --alter --add-config 'SCRAM-SHA-256=[iterations=8192,password=connect-secret],SCRAM-SHA-512=[iterations=8192,password=connect-secret]' --entity-type users --entity-name connect
./kafka-configs --bootstrap-server localhost:9095 --alter --add-config 'SCRAM-SHA-256=[iterations=8192,password=erp-secret],SCRAM-SHA-512=[iterations=8192,password=erp-secret]' --entity-type users --entity-name erp
./kafka-configs --bootstrap-server localhost:9095 --alter --add-config 'SCRAM-SHA-256=[iterations=8192,password=c3-secret],SCRAM-SHA-512=[iterations=8192,password=c3-secret]' --entity-type users --entity-name c3
./kafka-configs --bootstrap-server localhost:9095 --entity-type users --describe --all
