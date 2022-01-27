# Kafka Connect Connectors

## Confluent

- https://www.confluent.io/hub/
- https://www.confluent.io/product/connectors/
- https://docs.confluent.io/platform/current/connect/index.html
- https://docs.confluent.io/platform/current/connect/references/allconfigs.html
- https://docs.confluent.io/platform/current/connect/references/connector-configs.html

## Debezium

- https://debezium.io/

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
