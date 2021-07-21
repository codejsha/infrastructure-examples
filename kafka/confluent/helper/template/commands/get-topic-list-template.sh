#!/bin/bash

CONFLUENT_HOME=""
BOOTSTRAP_SERVER=""

${CONFLUENT_HOME}/bin/kafka-topics \
    --bootstrap-server "${BOOTSTRAP_SERVER}" \
    --list
