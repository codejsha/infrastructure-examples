#!/bin/bash

CONFLUENT_HOME=""
BOOTSTRAP_SERVER=""
TOPIC_NAME="${1}"

${CONFLUENT_HOME}/bin/kafka-topics \
    --bootstrap-server "${BOOTSTRAP_SERVER}" \
    --describe \
    --topic "${TOPIC_NAME}"
