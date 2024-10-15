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
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```

## References

sample database: Sakila (cf. [MySQL README](/mysql/README.md))
