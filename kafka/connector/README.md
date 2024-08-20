# Kafka Connect Connectors

## Kafka Connect REST API

connector plugin list:

```bash
curl --header "Accept:application/json" http://localhost:8083/connector-plugins | jq '.[].class'
```

connector list:

```bash
curl --header "Accept:application/json" http://localhost:8083/connectors | jq
```

- Kafka Connect REST Interface for Confluent Platform: <https://docs.confluent.io/platform/current/connect/references/restapi.html>

## References

Confluent:

- Confluent Hub: <https://www.confluent.io/hub/>
- Confluent Open Source / Community / Partner Connectors: <https://www.confluent.io/product/connectors/>
- Kafka Connect Confluent Docs: <https://docs.confluent.io/platform/current/connect/index.html>
- Kafka Connect Worker Configuration Properties for Confluent Platform: <https://docs.confluent.io/platform/current/connect/references/allconfigs.html>
- Connector Configuration Properties for Confluent Platform: <https://docs.confluent.io/platform/current/connect/references/connector-configs.html>

Debezium:

- Debezium Documentation: <https://debezium.io/documentation/>
