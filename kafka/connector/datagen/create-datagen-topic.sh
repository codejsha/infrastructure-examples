#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################
### apache kafka
######################################################################

# kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic campaign_finance
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_events
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_codes
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_users
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic credit_cards
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic inventory
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic orders
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic pageviews
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic product
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic purchases
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic ratings
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic stock_trades
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic stores
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic transactions
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic users
kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic users_array_map

# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/campaign_finance-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-campaign_finance-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/campaign_finance-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/clickstream_events-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-clickstream_events-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/clickstream_events-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/clickstream_codes-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-clickstream_codes-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/clickstream_codes-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/clickstream_users-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-clickstream_users-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/clickstream_users-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/credit_cards-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-credit_cards-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/credit_cards-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/inventory-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-inventory-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/inventory-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/orders-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-orders-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/orders-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/pageviews-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-pageviews-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/pageviews-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/product-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-product-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/product-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/purchases-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-purchases-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/purchases-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/ratings-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-ratings-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/ratings-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/stock_trades-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-stock_trades-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/stock_trades-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/stores-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-stores-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/stores-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/transactions-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-transactions-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/transactions-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/users-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-users-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/users-value/versions | jq
curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/users_array_map-key/versions | jq
curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-users_array_map-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/users_array_map-value/versions | jq

######################################################################
### confluent kafka
######################################################################

# # kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic campaign_finance
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_events
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_codes
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic clickstream_users
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic credit_cards
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic inventory
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic orders
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic pageviews
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic product
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic purchases
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic ratings
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic stock_trades
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic stores
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic transactions
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic users
# kafka-topics --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 3 --topic users_array_map

# # curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/campaign_finance-key/versions | jq
# # curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-campaign_finance-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/campaign_finance-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/clickstream_events-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-clickstream_events-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/clickstream_events-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/clickstream_codes-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-clickstream_codes-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/clickstream_codes-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/clickstream_users-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-clickstream_users-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/clickstream_users-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/credit_cards-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-credit_cards-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/credit_cards-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/inventory-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-inventory-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/inventory-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/orders-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-orders-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/orders-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/pageviews-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-pageviews-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/pageviews-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/product-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-product-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/product-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/purchases-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-purchases-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/purchases-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/ratings-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-ratings-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/ratings-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/stock_trades-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-stock_trades-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/stock_trades-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"int\"}"}' http://localhost:8081/subjects/stores-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-stores-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/stores-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"long\"}"}' http://localhost:8081/subjects/transactions-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-transactions-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/transactions-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/users-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-users-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/users-value/versions | jq
# curl --silent --request POST --header "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"schema": "{\"type\": \"string\"}"}' http://localhost:8081/subjects/users_array_map-key/versions | jq
# curl --silent --request POST --header "Content-Type:application/vnd.schemaregistry.v1+json" --data "{\"schema\": $(cat schema-users_array_map-value-v1.avsc | jq -c . | jq -R .)}" http://localhost:8081/subjects/users_array_map-value/versions | jq
