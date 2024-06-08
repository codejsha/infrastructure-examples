######################################################################
### confluent kafka
######################################################################

### console

kafka-console-producer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --topic my-topic

### key,value
kafka-console-producer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property parse.key=true \
    --property key.separator=, \
    --topic my-topic

######################################################################

### avro

kafka-avro-console-producer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property print.key=true \
    --property schema.registry.url=http://schema-registry1.example.com:8081,http://schema-registry2.example.com:8081 \
    --property value.schema='{"type":"record","name":"product","fields":[{"name":"string","price":"int"}]}' \
    --topic my-topic

kafka-avro-console-producer \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --property print.key=true \
    --property schema.registry.url=http://schema-registry1.example.com:8081,http://schema-registry2.example.com:8081 \
    --property value.schema="$(< product.avsc)" \
    --topic my-topic

######################################################################

### perf-test

### producer-props
kafka-producer-perf-test \
    --producer-props \
        bootstrap.servers=kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
        client.id=perf-test-producer \
    --topic perf-test \
    --num-records 1000 \
    --throughput -1 \
    --record-size 500000

### producer.properties
kafka-producer-perf-test \
    --producer.config producer.properties \
    --topic perf-test \
    --num-records 1000 \
    --throughput -1 \
    --record-size 500000
