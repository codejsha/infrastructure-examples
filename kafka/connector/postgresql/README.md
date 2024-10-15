# PostgreSQL Source Connector

## Configuration

include/exclude configurations:

```json
    "database.dbname": "",
    "schema.include.list": "",
    "schema.exclude.list": "",
    "table.include.list": "",
    "table.exclude.list": "",
    "column.include.list": "",
    "column.exclude.list": "",
```

## Management

```sh
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="postgresql-source"
CONNECTOR_CONFIG_FILE="postgresql-source.json"
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

sample database: dvdrental (cf. [PostgreSQL README](/postgresql/README.md))
