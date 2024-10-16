# FTP: SFTP CSV/JSON Source Connector

## Configuration

file path/pattern configurations:

```json
    "input.file.pattern": "",
    "input.path": "",
    "error.path": "",
    "finished.path": "",
```

## Management

```sh
### sftp csv source
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="sftp-csv-source"
CONNECTOR_CONFIG_FILE="sftp-csv-source.json"

### sftp csv sink
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="sftp-csv-sink"
CONNECTOR_CONFIG_FILE="sftp-csv-sink.json"

### sftp json source
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="sftp-json-source"
CONNECTOR_CONFIG_FILE="sftp-json-source.json"
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
