# Spooldir Source Connector

## Management

```sh
### spooldir csv source
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="spooldir-csv-source"
CONNECTOR_CONFIG_FILE="spooldir-csv-source.json"

### spooldir json source
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="spooldir-json-source"
CONNECTOR_CONFIG_FILE="spooldir-json-source.json"
```

create connector:

```sh
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```
