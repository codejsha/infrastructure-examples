# Cassandra Source and Sink Connectors

## Management

```sh
### cassandra source
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="cassandra-source"
CONNECTOR_CONFIG_FILE="cassandra-source.json"

### cassandra sink
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="cassandra-sink"
CONNECTOR_CONFIG_FILE="cassandra-sink.json"
```

create connector:

```sh
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```
