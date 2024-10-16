# MySQL Source Connector

## Configuration

include/exclude configurations:

```json
    "database.include.list": "",
    "database.exclude.list": "",
    "table.include.list": "",
    "table.exclude.list": "",
    "column.include.list": "",
    "column.exclude.list": "",
```

## Management

```sh
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="mysql-source"
CONNECTOR_CONFIG_FILE="mysql-source.json"
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

## References

sample database: Sakila (cf. [MySQL README](/mysql/README.md))
