# Confluent

Confluent Platform is an enterprise-level event streaming platform that is built on top of Apache Kafka. It enables you to process data as continuous, real-time streams.
It includes the following components: Schema Registry, Control Center, and ksqlDB (and more).

useful tools for kafka: *kafka-lag-exporter* and *kcat(kafkacat)*

## Installation

Confluent Platform installations can be done as Ansible Playbook in on-premise or Confluent Operator in Kubernetes.
And it is possible to run the Kafka servers using `docker-compose` for testing purposes. Or if you need a single server, you can use the `confluent local` commands.

## Examples

- docker-compose examples: [/infrastructure-examples/kafka/docker-compose](/kafka/docker-compose/)
- kafka connector examples: [/infrastructure-examples/kafka/connector](/kafka/connector/)

## References

docs:

- Confluent Platform: <https://docs.confluent.io/platform/current/overview.html>
- Confluent for Kubernetes: <https://docs.confluent.io/operator/current/overview.html>

confluent github examples:

- <https://github.com/confluentinc/examples.git>
- <https://github.com/confluentinc/kafka-streams-examples.git>
- <https://github.com/confluentinc/confluent-kubernetes-examples.git>

monitoring:

- <https://github.com/confluentinc/jmx-monitoring-stacks.git>
- <https://docs.confluent.io/platform/current/zookeeper/deployment.html>
- <https://docs.confluent.io/platform/current/kafka/monitoring.html>
- <https://docs.confluent.io/platform/current/schema-registry/monitoring.html>
- <https://docs.confluent.io/home/connect/monitoring.html>
- <https://docs.confluent.io/platform/current/multi-dc-deployments/replicator/replicator-monitoring.html>
- <https://docs.ksqldb.io/en/latest/reference/metrics/>
