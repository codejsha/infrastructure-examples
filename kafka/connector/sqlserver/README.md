# SQL Server Source Connector

## Configuration

include/exclude configurations:

```json
    "database.dbname": "",
    "table.include.list": "",
    "table.exclude.list": "",
    "column.include.list": "",
    "column.exclude.list": "",
```

## Management

```sh
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="sqlserver-source"
CONNECTOR_CONFIG_FILE="sqlserver-source.json"
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

sample database: Northwind (cf. [SQL Server README](/sqlserver/README.md))
