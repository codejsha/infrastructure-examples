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

## Examples

### inventory

create mysql source connector:

```sh
curl -X PUT -H "Content-Type: application/json" -d @mysql-source-inventory.json localhost:8083/connectors/inventory-connector/config
```

execute statements in mysql:

```sql
-- docker compose exec mysql mysql -u root -p
USE inventory;

UPDATE customers SET first_name='Anne Marie' WHERE id=1004;

DELETE FROM addresses WHERE customer_id=1004;
DELETE FROM customers WHERE id=1004;

INSERT INTO customers VALUES (default, "Sarah", "Thompson", "kitt@acme.com");
INSERT INTO customers VALUES (default, "Kenneth", "Anderson", "kander@acme.com");
```

## References

- [Kafka Connect: Build and Run Data Pipelines (O'Reilly)](https://www.oreilly.com/library/view/kafka-connect/9781098126520/)
- [Debezium connector for MySQL](https://debezium.io/documentation/reference/stable/connectors/mysql.htm)
- [Debezium Tutorial](https://debezium.io/documentation/reference/stable/tutorial.html)
- sample database: Sakila (cf. [MySQL README](/mysql/README.md))
