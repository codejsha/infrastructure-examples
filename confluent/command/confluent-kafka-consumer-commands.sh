######################################################################
### confluent kafka
######################################################################

### console

kafka-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --topic my-topic

### from beginning
kafka-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --topic my-topic \
    --from-beginning

### print key
kafka-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property print.key=true \
    --topic my-topic

######################################################################

### avro console

kafka-avro-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property print.key=false \
    --key-deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --topic my-topic

### from beginning
kafka-avro-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property print.key=false \
    --key-deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --from-beginning \
    --topic my-topic

### schema
kafka-avro-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property schema.registry.url=http://schema-registry1.example.com:8081,http://schema-registry2.example.com:8081 \
    --property print.key=false \
    --topic my-topic
kafka-avro-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --consumer.config /opt/confluent/etc/kafka/client.properties \
    --property schema.registry.url=http://schema-registry1.example.com:8081,http://schema-registry2.example.com:8081 \
    --property print.key=false \
    --from-beginning \
    --topic my-topic

### max message
kafka-avro-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property schema.registry.url=http://schema-registry1.example.com:8081,http://schema-registry2.example.com:8081 \
    --property print.key=true \
    --topic my-topic \
    --max-messages 1

######################################################################

### consumer group

### list
kafka-consumer-groups \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --list

### describe
kafka-consumer-groups \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --describe \
    --group my-group

### delete
kafka-consumer-groups \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --delete \
    --group my-group

######################################################################

### change consumer offset

### to earliest
kafka-consumer-groups \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --reset-offsets \
    --to-earliest \
    --group my-group \
    --topic my-topic \
    --execute
### to earliest (all topics)
kafka-consumer-groups \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --reset-offsets \
    --to-earliest \
    --group my-group \
    --all-topics \
    --execute

### to latest
kafka-consumer-groups \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --reset-offsets \
    --to-latest \
    --group my-group \
    --topic my-topic \
    --execute

### to datetime
kafka-consumer-groups \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --reset-offsets \
    --to-datetime 2022-01-01T00:00:00Z \
    --group my-group \
    --topic my-topic \
    --execute

######################################################################

### internal topic

### __consumer_offsets
kafka-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property exclude.internal.topic=false \
    --formatter "kafka.coordinator.group.GroupMetadataManager\$OffsetsMessageFormatter" \
    --topic __consumer_offsets \
    --from-beginning
kafka-run-class kafka.tools.DumpLogSegments \
    --offsets-decoder \
    --print-data-log \
    --files 00000000000000000000.log

### __transaction_state
kafka-console-consumer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property exclude.internal.topic=false \
    --formatter "kafka.coordinator.transaction.TransactionLog\$TransactionLogMessageFormatter" \
    --topic __transaction_state \
    --from-beginning

