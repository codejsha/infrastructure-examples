######################################################################
### apache kafka
######################################################################

### console consumer

kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --topic my.topic
kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --topic my.topic \
    --from-beginning

alias dce="docker compose exec"
dce kafka-client kafka-console-consumer.sh --bootstrap-server kafka-broker:9092 --topic my.topic
dce kafka-client kafka-console-consumer.sh --bootstrap-server kafka-broker:9092 --topic my.topic --from-beginning
dce kafka-client kafka-console-consumer.sh --bootstrap-server kafka-broker:9092 --topic perf.test

### print key
kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --property print.key=true \
    --topic my.topic

dce kafka-client kafka-console-consumer.sh --bootstrap-server kafka-broker:9092 --property print.key=true --topic my.topic
dce kafka-client kafka-console-consumer.sh --bootstrap-server kafka-broker:9092 --property print.key=true --topic my.topic --from-beginning

### whitelist
kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --property print.key=true \
    --whitelist my.topic,my.topic2

######################################################################

### consume from specific point

### get offsets by timestamp
TIMESTAMP=$(date -d '2026-09-01 00:00:00' +%s000)
kafka-get-offsets.sh \
    --bootstrap-server localhost:9092 \
    --topic my.topic \
    --time ${TIMESTAMP}

### consume from specific offset
kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --property print.key=true \
    --property print.timestamp=true \
    --timeout-ms 10000 \
    --topic my.topic \
    --partition 0 \
    --offset 123

######################################################################

### consumer group

### list
kafka-consumer-groups.sh \
    --bootstrap-server localhost:9092 \
    --list

dce kafka-client kafka-consumer-groups.sh --bootstrap-server kafka-broker:9092 --list

### describe
kafka-consumer-groups.sh \
    --bootstrap-server localhost:9092 \
    --describe \
    --group my-group

dce kafka-client kafka-consumer-groups.sh --bootstrap-server kafka-broker:9092 --describe --group my-group

### delete
kafka-consumer-groups.sh \
    --bootstrap-server localhost:9092 \
    --delete \
    --group my-group

dce kafka-client kafka-consumer-groups.sh --bootstrap-server kafka-broker:9092 --delete --group my-group

######################################################################

### verifiable consumer

kafka-verifiable-consumer.sh \
    --bootstrap-server localhost:9092 \
    --group-id verify-group \
    --topic verify.test
