######################################################################
### apache kafka
######################################################################

### console producer

kafka-console-producer.sh \
    --bootstrap-server localhost:9092 \
    --topic my.topic

alias dce="docker compose exec"
dce kafka-client kafka-console-producer.sh --bootstrap-server kafka-broker:9092 --topic my.topic

######################################################################

### verifiable producer

kafka-verifiable-producer.sh \
    --bootstrap-server localhost:9092 \
    --max-messages 100 \
    --topic verify.test

######################################################################

### perf-test

### producer-props
kafka-producer-perf-test.sh \
    --producer-props \
        bootstrap.servers=localhost:9092 \
        client.id=perf-test-producer \
    --topic perf.test \
    --num-records 1000000 \
    --record-size 100 \
    --throughput 10000

dce kafka-client kafka-producer-perf-test.sh \
    --producer-props \
        bootstrap.servers=kafka-broker:9092 \
        client.id=perf-test-producer \
    --topic perf.test \
    --num-records 1000000 \
    --record-size 100 \
    --throughput 10000

### producer.properties
kafka-producer-perf-test.sh \
    --producer.config producer.properties \
    --topic perf.test \
    --num-records 1000000 \
    --record-size 100 \
    --throughput 10000
