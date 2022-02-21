#!/bin/bash

KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="sftp-csv-source"
CONNECTOR_CONFIG_FILE="sftp-csv-source.json"

### delete connector
curl \
    --request DELETE \
    --header "Accept:application/json" \
    ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}

echo

### register connector
curl \
    --request POST \
    --header "Accept:application/json" \
    --header "Content-Type:application/json" \
    --data @${CONNECTOR_CONFIG_FILE} \
    ${KAFKA_CONNECT_URL}/connectors

echo
