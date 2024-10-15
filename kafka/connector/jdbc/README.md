# JDBC Sink Connector

## Requirement

download the JDBC driver and add it to classpath

```bash
### download
curl https://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-8.0.27.tar.gz | tar xz
```

## Configuration

mapping configurations:

```json
    "pk.mode": "",
    "pk.fields": "",
    "fields.whitelist": "",
```

## Management

```sh
### jdbc source
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="jdbc-source"
CONNECTOR_CONFIG_FILE="jdbc-source.json"

### jdbc sink
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="jdbc-sink"
CONNECTOR_CONFIG_FILE="jdbc-sink.json"
```

create connector:

```sh
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```
