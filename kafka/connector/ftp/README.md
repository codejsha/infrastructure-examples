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
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```
