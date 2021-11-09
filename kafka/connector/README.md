# Kafka Connect Connectors

- https://debezium.io/
- https://www.confluent.io/hub/
- https://www.confluent.io/product/connectors/

## Debezium

- https://debezium.io/documentation/reference/1.4/index.html
- https://debezium.io/documentation/reference/1.4/architecture.html
- https://debezium.io/documentation/reference/1.4/tutorial.html

## Confluent

- https://docs.confluent.io/platform/current/connect/index.html
- https://docs.confluent.io/platform/current/connect/references/allconfigs.html
- https://docs.confluent.io/platform/current/connect/references/connector-configs.html

### REST API

- https://docs.confluent.io/platform/current/connect/references/restapi.html

connector plugin list:

```bash
curl --header "Accept:application/json" http://localhost:8083/connector-plugins | jq .[].class
curl --header "Accept:application/json" http://kafka-connect1:8083/connector-plugins | jq .[].class
curl --header "Accept:application/json" http://kafka-connect.example.com/connector-plugins | jq .[].class
```

connector list:

```bash
curl --header "Accept:application/json" http://localhost:8083/connectors | jq
curl --header "Accept:application/json" http://kafka-connect1:8083/connectors | jq
curl --header "Accept:application/json" http://kafka-connect.example.com/connectors | jq
```
