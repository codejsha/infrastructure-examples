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
curl -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

update connector:

```sh
curl -X PUT -H "Content-Type: application/json" -d $(jq -c .config ${CONNECTOR_CONFIG_FILE}) ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}/config
```

delete connector:

```sh
curl -X DELETE -H "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```
