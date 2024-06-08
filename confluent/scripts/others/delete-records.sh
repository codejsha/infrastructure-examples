#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

CONFLUENT_BASE="/opt/confluent"
CONFLUENT_HOME="${CONFLUENT_BASE}/confluent-7.0.1"

${CONFLUENT_HOME}/bin/kafka-delete-records \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config ${CONFLUENT_BASE}/etc/kafka/client.properties \
    --offset-json-file ${CONFLUENT_BASE}/scripts/others/delete-records.json
