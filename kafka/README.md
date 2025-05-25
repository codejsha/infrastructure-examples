# Apache Kafka

Apache Kafka is an open-source distributed streaming platform that is used to build real-time data pipelines and streaming applications

## Install

- [/infrastructure-examples/kafka/docker-compose](/kafka/docker-compose/)
- [/infrastructure-examples/kafka/standalone](/kafka/standalone/)

## Confluent Kafka

Confluent Platform is an enterprise-level event streaming platform that is built on top of Apache Kafka.

[/infrastructure-examples/confluent](/confluent/)

## Converter Classes

use with Confluent Schema Registry:

- `io.confluent.connect.avro.AvroConverter`
- `io.confluent.connect.protobuf.ProtobufConverter`
- `io.confluent.connect.json.JsonSchemaConverter`

without Confluent Schema Registry:

- `org.apache.kafka.connect.storage.StringConverter`
- `org.apache.kafka.connect.json.JsonConverter`
- `org.apache.kafka.connect.converters.ByteArrayConverter`

built-in primitive converters in Kafka Connect:

- `org.apache.kafka.connect.converters.DoubleConverter` (FLOAT64)
- `org.apache.kafka.connect.converters.FloatConverter` (FLOAT32)
- `org.apache.kafka.connect.converters.IntegerConverter` (INT32)
- `org.apache.kafka.connect.converters.LongConverter` (INT64)
- `org.apache.kafka.connect.converters.ShortConverter` (INT16)

## Tools

- kafka-lag-exporter: [/infrastructure-examples/kafka/kafka-lag-exporter](/kafka/kafka-lag-exporter/)
- kcat: [/infrastructure-examples/kafka/kcat](/kafka/kcat/)
- burrow: [/infrastructure-examples/kafka/burrow](/kafka/burrow/)
- kafka-ui: [/infrastructure-examples/kafka/kafka-ui](/kafka/kafka-ui/)
- kafdrop: [/infrastructure-examples/kafka/kafdrop](/kafka/kafdrop/)

others:

- cruise-control: <https://github.com/linkedin/cruise-control>
- cmak (kafka-manager): [/infrastructure-examples/kafka/cmak](/kafka/cmak/)
- xinfra-monitor (kafka monitor): <https://github.com/linkedin/kafka-monitor>
- secor: <https://github.com/pinterest/secor>

## Kafka Connect Connectors

kafka connector configuration examples: [/infrastructure-examples/kafka/connector](/kafka/connector/)

## References

- Apache Kafka Documentation: <https://kafka.apache.org/documentation/>
