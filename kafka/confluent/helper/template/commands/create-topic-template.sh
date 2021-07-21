#!/bin/bash

CONFLUENT_HOME=""
BOOTSTRAP_SERVER=""
TOPIC_NAME="${1}"
PARTITION_COUNT="3"
REPLICATION_FACTOR="3"

${CONFLUENT_HOME}/bin/kafka-topics \
    --bootstrap-server "${BOOTSTRAP_SERVER}" \
    --create \
    --topic "${TOPIC_NAME}" \
    --partitions "${PARTITION_COUNT}" \
    --replication-factor "${REPLICATION_FACTOR}"
