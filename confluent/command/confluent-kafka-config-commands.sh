######################################################################
### confluent kafka
######################################################################

### describe topic
./kafka-configs \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type topics \
    --entity-name my-topic \
    --describe

### describe brokers
kafka-configs \
    --bootstrap-server localhost:9095 \
    --entity-type brokers \
    --describe \
    --all

### describe users
kafka-configs \
    --bootstrap-server localhost:9095 \
    --entity-type users \
    --describe \
    --all
