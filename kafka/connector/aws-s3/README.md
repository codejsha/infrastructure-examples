# AWS S3 Sink Connector

- https://docs.confluent.io/kafka-connect-s3-sink/current/overview.html

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
