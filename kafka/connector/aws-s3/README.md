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
    "store.url": "http://minio.example.com",
    "s3.region": "us-west-1",
    "s3.bucket.name": "kafka-s3-sink-storage",
    "s3.part.size": "5242880",
```

## Management

```sh
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="aws-s3-sink"
CONNECTOR_CONFIG_FILE="aws-s3-sink.json"
```

create connector:

```sh
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```

## References

- Amazon S3 Sink Connector for Confluent Platform: <https://docs.confluent.io/kafka-connectors/s3-sink/current/overview.html>
