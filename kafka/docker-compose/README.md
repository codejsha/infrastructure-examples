# kafka docker-compose examples

docker compose commands:

```sh
# start
docker compose up -d
# down
docker compose down --remove-orphans --volumes
```

## apache kafka

### apache-kraft-1

- kafka broker in kraft mode

### apache-kraft-2

- kafka broker in kraft mode
- ksqldb
- mysql

### apache-zk-1

single node cluster with basic configuration

- zookeeper
- kafka broker

### apache-zk-2

single node cluster with health checks

- zookeeper
- kafka broker
- schema registry
- kafka rest

### apache-ha-zk-1

kafka cluster with high availability

- zookeeper (3 nodes)
- kafka broker (3 nodes)
- schema registry
- kafka connect worker (2 nodes)
- ksqldb
- prometheus
- grafana
- kafka lag exporter
- burrow
- kafka ui
- mysql
- localstack
- kafka client

requirements:

- download the prometheus jmx exporter agent file. cf. [jmx exporter github](https://github.com/prometheus/jmx_exporter)

```sh
curl -o ./apache-ha-zk-1/jmx_prometheus_javaagent-0.20.0.jar -LJO https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.20.0/jmx_prometheus_javaagent-0.20.0.jar
```

- copy `jmx-exporter` directory from [shared-assets/jmx-exporter](https://github.com/confluentinc/jmx-monitoring-stacks/tree/main/shared-assets/jmx-exporter) of confluent platform monitoring stack
- copy `prometheus/prometheus-alerts` directory from [jmxexporter-prometheus-grafana/assets/prometheus/prometheus-alerts](https://github.com/confluentinc/jmx-monitoring-stacks/tree/main/jmxexporter-prometheus-grafana/assets/prometheus/prometheus-alerts) of confluent platform monitoring stack
- copy `grafana/dashboards` directory from [jmxexporter-prometheus-grafana/assets/grafana/provisioning/dashboards](https://github.com/confluentinc/jmx-monitoring-stacks/tree/main/jmxexporter-prometheus-grafana/assets/grafana/provisioning/dashboards) of confluent platform monitoring stack

```sh
git clone https://github.com/confluentinc/jmx-monitoring-stacks

/bin/cp -rf jmx-monitoring-stacks/shared-assets/jmx-exporter/ apache-ha-zk-1/jmx-exporter/
/bin/cp -rf jmx-monitoring-stacks/jmxexporter-prometheus-grafana/assets/prometheus/prometheus-alerts/ apache-ha-zk-1/prometheus/prometheus-alerts/

DASHBOARD_DIR="jmx-monitoring-stacks/jmxexporter-prometheus-grafana/assets/grafana/provisioning/dashboards"
/bin/cp -f ${DASHBOARD_DIR}/dashboard.yml apache-ha-zk-1/grafana/dashboards/
DASHBOARD_FILES=(
    "debezium-connectors.json"
    "kafka-cluster.json"
    "kafka-connect-cluster.json"
    "kafka-consumer.json"
    "kafka-lag-exporter.json"
    "kafka-producer.json"
    "kafka-stream.json"
    "kafka-topics.json"
    "kafka-transaction-coordinator.json"
    "ksqldb-cluster.json"
    "schema-registry-cluster.json"
    "zookeeper-cluster.json"
)
mkdir -p apache-ha-zk-1/grafana/dashboards
for DASHBOARD in "${DASHBOARD_FILES[@]}"; do
    jq 'walk(if type == "object" and .datasource? and .datasource.uid? then .datasource.uid = "prometheus" else . end)' ${DASHBOARD_DIR}/${DASHBOARD} > apache-ha-zk-1/grafana/dashboards/${DASHBOARD}
done
```

- download the kafka connect avro converter from <https://www.confluent.io/hub/confluentinc/kafka-connect-avro-converter>
- download the kafka connect json schema converter from <https://www.confluent.io/hub/confluentinc/kafka-connect-json-schema-converter>
- download the datagen source connector from <https://www.confluent.io/hub/confluentinc/kafka-connect-datagen>
- download the amazon s3 sink connector from <https://www.confluent.io/hub/confluentinc/kafka-connect-s3>
- download the amazon s3 source connector from <https://www.confluent.io/hub/confluentinc/kafka-connect-s3-source>

```sh
# ./apache-ha-zk-1/connect-worker/confluentinc-kafka-connect-avro-converter-7.7.0.zip
# ./apache-ha-zk-1/connect-worker/confluentinc-kafka-connect-json-schema-converter-7.7.0.zip
# ./apache-ha-zk-1/connect-worker/confluentinc-kafka-connect-datagen-0.6.5.zip
# ./apache-ha-zk-1/connect-worker/confluentinc-kafka-connect-s3-10.5.15.zip
# ./apache-ha-zk-1/connect-worker/confluentinc-kafka-connect-s3-source-2.6.5.zip
```

## confluent kafka

### confluent-kraft-1

- kafka broker (community) in kraft mode
- schema registry

### confluent-kraft-2

- kafka broker (community) in kraft mode
- schema registry
- ksqldb
- ksqldb cli

### confluent-zk

- zookeeper
- kafka broker (commercial)
- schema registry
- kafka connect worker
- kafka-rest
- ksqldb
- ksqldb cli
- ksql-datagen
- control center
- prometheus
- grafana
- node exporter
- kafka lag exporter
