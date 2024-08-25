# Apache Kafka

Apache Kafka is an open-source distributed streaming platform that is used to build real-time data pipelines and streaming applications

## Install

### Binary/Archive

```bash
bash ./install-kafka.sh
```

### Docker Compose

[/infrastructure-examples/kafka/docker-compose](/kafka/docker-compose/)

## Confluent Kafka

Confluent Platform is an enterprise-level event streaming platform that is built on top of Apache Kafka.

[/infrastructure-examples/confluent](/confluent/)

## Tools

- kafka-lag-exporter: [/infrastructure-examples/kafka/kafka-lag-exporter](/kafka/kafka-lag-exporter/)
- kcat: [/infrastructure-examples/kafka/kcat](/kafka/kcat/)
- burrow
- kafka-ui
- kafdrop
- kouncil

others:

- cruise-control: <https://github.com/linkedin/cruise-control>
- cmak (kafka-manager): [/infrastructure-examples/kafka/cmak](/kafka/cmak/)
- kpow
- redpanda-console
- xinfra-monitor (kafka monitor): <https://github.com/linkedin/kafka-monitor>
- secor: <https://github.com/pinterest/secor>

## Kafka Connect Connectors

kafka connector configuration examples: [/infrastructure-examples/kafka/connector](/kafka/connector/)

## References

- Apache Kafka Documentation: <https://kafka.apache.org/documentation/>
