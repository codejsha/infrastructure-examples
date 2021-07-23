#!/bin/bash

KAFKA_CONNECT_URL="http://localhost:8083"
# KAFKA_CONNECT_URL="http://kafka-connect1:8083"
# KAFKA_CONNECT_URL="http://kafka-connect.example.com"

CONNECTOR_NAME="jdbc-sink"
CONNECTOR_CONFIG_FILE="jdbc-sink.json"
# CONNECTOR_CONFIG_FILE="jdbc-sink-pk.json"

### delete connector
curl \
    --request DELETE \
    --header "Accept:application/json" \
    ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}

### register connector
curl \
    --request POST \
    --header "Accept:application/json" \
    --header "Content-Type:application/json" \
    --data @${CONNECTOR_CONFIG_FILE} \
    ${KAFKA_CONNECT_URL}/connectors

echo
