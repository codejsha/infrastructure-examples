######################################################################
### apache kafka
######################################################################

### console

./kafka-console-consumer.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --topic my-topic

### from beginning
./kafka-console-consumer.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --topic my-topic \
    --from-beginning

### print key
./kafka-console-consumer.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --property print.key=true \
    --topic my-topic

### whitelist
./kafka-console-consumer.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --property print.key=true \
    --whitelist my-topic,my-topic2

######################################################################

### consumer group

### list
./kafka-consumer-groups.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --list

### describe
./kafka-consumer-groups.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --describe \
    --group my-group

### delete
./kafka-consumer-groups.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --delete \
    --group my-group

######################################################################

### verifiable consumer

./kafka-verifiable-consumer.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --group-id verify-group \
    --topic verify-test
