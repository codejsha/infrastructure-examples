# Datagen Connector

## Quickstart

`DatagenTask.Quickstart` enum:

- `campaign_finance`
- `clickstream`
- `clickstream_codes`
- `clickstream_users`
- `credit_cards`
- `inventory`
- `orders`
- `pageviews`
- `product`
- `purchases`
- `ratings`
- `stock_trades`
- `stores`
- `transactions`
- `users`
- `users_` (users_array_map)

## Management

```sh
### campaign_finance
# KAFKA_CONNECT_URL="http://localhost:8083"
# CONNECTOR_NAME="datagen-campaign-finance"
# CONNECTOR_CONFIG_FILE="datagen-campaign-finance.json"

### clickstream
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-clickstream-events"
CONNECTOR_CONFIG_FILE="datagen-clickstream-events.json"

## clickstream_codes
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-clickstream-codes"
CONNECTOR_CONFIG_FILE="datagen-clickstream-codes.json"

### clickstream_users
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-clickstream-users"
CONNECTOR_CONFIG_FILE="datagen-clickstream-users.json"

### credit_cards
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-credit-cards"
CONNECTOR_CONFIG_FILE="datagen-credit-cards.json"

### inventory
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-inventory"
CONNECTOR_CONFIG_FILE="datagen-inventory.json"

### orders
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-orders"
CONNECTOR_CONFIG_FILE="datagen-orders.json"

### pageviews
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-pageviews"
CONNECTOR_CONFIG_FILE="datagen-pageviews.json"

### product
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-product"
CONNECTOR_CONFIG_FILE="datagen-product.json"

### purchases
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-purchases"
CONNECTOR_CONFIG_FILE="datagen-purchases.json"

### ratings
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-ratings"
CONNECTOR_CONFIG_FILE="datagen-ratings.json"

### stock_trades
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-stock-trades"
CONNECTOR_CONFIG_FILE="datagen-stock-trades.json"

### stores
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-stores"
CONNECTOR_CONFIG_FILE="datagen-stores.json"

### transactions
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-transactions"
CONNECTOR_CONFIG_FILE="datagen-transactions.json"

### users
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-users"
CONNECTOR_CONFIG_FILE="datagen-users.json"

### users_ (users_array_map)
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-users-array-map"
CONNECTOR_CONFIG_FILE="datagen-users-array-map.json"
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

- [Kafka Connect: Build and Run Data Pipelines (O'Reilly)](https://www.oreilly.com/library/view/kafka-connect/9781098126520/)
- [Confluent Datagen Connector GitHub](https://github.com/confluentinc/kafka-connect-datagen)
- [Apache Kafka and Confluent Platform examples and demos GitHub](https://github.com/confluentinc/examples.git)
