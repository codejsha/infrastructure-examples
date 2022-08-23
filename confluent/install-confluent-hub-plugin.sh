#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

CONFLUENT_HOME="/opt/confluent/confluent-7.2.1"

### examples:
### ${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-datagen:latest
### ${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins confluentinc/kafka-connect-datagen:latest
### ${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest

### source
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-datagen:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-replicator:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-s3-source:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-kinesis:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-azure-blob-storage-source:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-azure-service-bus:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-azure-event-hubs:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-gcs-source:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-gcp-pubsub:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-hdfs3-source:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-rabbitmq:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-activemq:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-jms:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-weblogic:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-oracle-cdc:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties debezium/debezium-connector-postgresql:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties debezium/debezium-connector-mysql:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties debezium/debezium-connector-sqlserver:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties debezium/debezium-connector-mongodb:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties jcustenborder/kafka-connect-spooldir:latest

### sink
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-s3:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-aws-dynamodb:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-aws-lambda:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-azure-blob-storage:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-azure-data-lake-gen2-storage:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-azure-functions:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-gcs:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-gcp-bigtable:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-gcp-functions:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-databricks-delta-lake:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-hdfs3:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-rabbitmq-sink:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-activemq-sink:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-elasticsearch:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-cassandra:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-hbase:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-jms-sink:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-http:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-prometheus-metrics:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties snowflakeinc/snowflake-kafka-connector:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties jcustenborder/kafka-connect-redis:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties wepay/kafka-connect-bigquery:latest

### source and sink
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-firebase:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-jdbc:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-mqtt:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-influxdb:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-sftp:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-ftps:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties mongodb/kafka-connect-mongodb:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties neo4j/kafka-connect-neo4j:latest

### transform
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/connect-transforms:latest

### converter
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-json-schema-converter:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-avro-converter:latest
${CONFLUENT_HOME}/bin/confluent-hub install --no-prompt --component-dir /opt/confluent/connect/plugins --worker-configs /opt/confluent/etc/kafka/connect-distributed.properties confluentinc/kafka-connect-protobuf-converter:latest
