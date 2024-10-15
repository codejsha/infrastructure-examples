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
curl --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

delete connector:

```sh
curl --request DELETE --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```

## References

- <https://github.com/confluentinc/kafka-connect-datagen>
