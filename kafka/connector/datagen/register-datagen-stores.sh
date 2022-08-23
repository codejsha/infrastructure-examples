#!/bin/bash

KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-stores"
CONNECTOR_CONFIG_FILE="datagen-stores.json"

######################################################################

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

######################################################################

# ### delete connector
# curl \
#     --user kafka-connect:kafka-connect-secret \
#     --request DELETE \
#     --header "Accept:application/json" \
#     --cacert /opt/confluent/ssl/ca.crt \
#     --cert /opt/confluent/ssl/kafka_connect.crt \
#     --key /opt/confluent/ssl/kafka_connect.key \
#     ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
#
# echo
#
# ### register connector
# curl \
#     --user kafka-connect:kafka-connect-secret \
#     --request POST \
#     --header "Accept:application/json" \
#     --header "Content-Type:application/json" \
#     --cacert /opt/confluent/ssl/ca.crt \
#     --cert /opt/confluent/ssl/kafka_connect.crt \
#     --key /opt/confluent/ssl/kafka_connect.key \
#     --data @${CONNECTOR_CONFIG_FILE} \
#     ${KAFKA_CONNECT_URL}/connectors
#
# echo
