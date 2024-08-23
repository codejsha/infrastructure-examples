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
- prometheus
- grafana
- kafka lag exporter
- burrow
- kafka ui
- kafka client

requirements:

- prometheus jmx exporter agent file. cf. [jmx exporter github](https://github.com/prometheus/jmx_exporter)
- `jmx-exporter` directory. cf. [shared-assets/jmx-exporter](https://github.com/confluentinc/jmx-monitoring-stacks/tree/main/shared-assets/jmx-exporter) of confluent platform monitoring stack
- `prometheus/prometheus-alerts` directory. cf. [jmxexporter-prometheus-grafana/assets/prometheus/prometheus-alerts](https://github.com/confluentinc/jmx-monitoring-stacks/tree/main/jmxexporter-prometheus-grafana/assets/prometheus/prometheus-alerts) of confluent platform monitoring stack
- `grafana/dashboards` directory. cf. [jmxexporter-prometheus-grafana/assets/grafana/provisioning/dashboards](https://github.com/confluentinc/jmx-monitoring-stacks/tree/main/jmxexporter-prometheus-grafana/assets/grafana/provisioning/dashboards) of confluent platform monitoring stack

```sh
curl -o ./apache-ha-zk-1/jmx_prometheus_javaagent-0.20.0.jar -LJO https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.20.0/jmx_prometheus_javaagent-0.20.0.jar

git clone https://github.com/confluentinc/jmx-monitoring-stacks
/bin/cp -rf jmx-monitoring-stacks/shared-assets/jmx-exporter/ apache-ha-zk-1/jmx-exporter/
/bin/cp -rf jmx-monitoring-stacks/jmxexporter-prometheus-grafana/assets/prometheus/prometheus-alerts/ apache-ha-zk-1/prometheus/prometheus-alerts/
/bin/cp -rf jmx-monitoring-stacks/jmxexporter-prometheus-grafana/assets/grafana/provisioning/dashboards/ apache-ha-zk-1/grafana/dashboards/
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
