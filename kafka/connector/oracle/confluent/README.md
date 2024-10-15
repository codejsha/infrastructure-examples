# Confluent Oracle CDC Source Connector

## Management

```sh
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="oracle-source"
CONNECTOR_CONFIG_FILE="oracle-source.json"
```

create connector:

```sh
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```
