######################################################################
### apache kafka
######################################################################

### console
./kafka-console-producer.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --topic my-topic

######################################################################

### verifiable producer

./kafka-verifiable-producer.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --max-messages 100 \
    --topic verify-test

######################################################################

### perf-test

### producer-props
./kafka-producer-perf-test.sh \
    --producer-props \
        bootstrap.servers=kafka1:9092,kafka2:9092,kafka3:9092 \
        client.id=perf-test-producer \
    --topic perf-test \
    --num-records 1000 \
    --throughput -1 \
    --record-size 500000

### producer.properties
./kafka-producer-perf-test.sh \
    --producer.config producer.properties \
    --topic perf-test \
    --num-records 1000 \
    --throughput -1 \
    --record-size 500000
