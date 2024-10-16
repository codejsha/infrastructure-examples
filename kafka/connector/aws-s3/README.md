# AWS S3 Sink Connector

## Configuration

aws credentials in kafka-connect start script:

```bash
### aws credentials
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
```

s3 bucket configurations:

```json
    "store.url": "http://localstack:4566",
    "s3.region": "us-west-1",
    "s3.bucket.name": "sink-pageviews",
    "s3.part.size": "5242880",
```

## Management

```sh
### s3-sink-pageviews
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="s3-sink-pageviews"
CONNECTOR_CONFIG_FILE="s3-sink-pageviews.json"

### s3-sink-orders-field
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="s3-sink-field"
CONNECTOR_CONFIG_FILE="s3-sink-orders-field.json"

### s3-sink-orders-time
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="s3-sink-time"
CONNECTOR_CONFIG_FILE="s3-sink-orders-time.json"
```

create connector:

```sh
curl -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

update connector:

```sh
curl -X PUT -H "Content-Type: application/json" -d $(jq -c .config ${CONNECTOR_CONFIG_FILE}) ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}/config
```

delete connector:

```sh
curl -X DELETE -H "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```

## Examples

### sink-pageviews

create s3 buckets:

```sh
aws --endpoint-url=http://localhost:4566 s3 mb s3://sink-pageviews


### sink-orders

create s3 buckets:

```sh
aws --endpoint-url=http://localhost:4566 s3 mb s3://orders-field
aws --endpoint-url=http://localhost:4566 s3 mb s3://orders-time

aws --endpoint-url=http://localhost:4566 s3 ls --recursive orders-field
aws --endpoint-url=http://localhost:4566 s3 ls --recursive orders-time
```

create a topic:

```sh
# alias dce='docker compose exec'
dce kafka-client kafka-topics.sh --bootstrap-server kafka-broker:9092 \
  --create --topic orders \
  --partitions 3 --replication-factor 1
```

create s3 sink connectors:

```sh
curl -X PUT -H "Content-Type: application/json" -d @s3-sink-orders-field.json localhost:8083/connectors/s3-sink-field/config
curl -X PUT -H "Content-Type: application/json" -d @s3-sink-orders-time.json localhost:8083/connectors/s3-sink-time/config
```

send messages to the 'orders' topic:

```sh
dce kafka-client kafka-console-producer.sh --bootstrap-server kafka-broker:9092 \
  --topic orders --property parse.key=true --property key.separator=:
```

```txt
1:{"schema": {"type": "struct", "fields": [{"type": "int64", "field": "id"},{"type": "string", "field": "title"},{"type": "int16", "field": "quantity"}],"name": "order"}, "payload": {"id": 1, "title": "Kafka The Definitive Guide","quantity": 2}}
2:{"schema": {"type": "struct", "fields": [{"type": "int64", "field": "id"},{"type": "string", "field": "title"},{"type": "int16", "field": "quantity"}],"name": "order"}, "payload":{"id": 2, "title": "Mastering Kafka Streams and ksqlDB", "quantity": 1}}
3:{"schema": {"type": "struct", "fields": [{"type": "int64", "field": "id"},{"type": "string", "field": "title"}, {"type": "int16", "field": "quantity"}],"name": "order"}, "payload": {"id": 3, "title": "Kafka Connect", "quantity": 1}}
3:{"schema": {"type": "struct", "fields": [{"type": "int64", "field": "id"},{"type": "string", "field": "title"}, {"type": "int16", "field": "quantity"}],"name": "order"}, "payload": {"id": 3, "title": "Kafka Connect", "quantity": 2}}
```

## References

- Amazon S3 Sink Connector for Confluent Platform: <https://docs.confluent.io/kafka-connectors/s3-sink/current/overview.html>
