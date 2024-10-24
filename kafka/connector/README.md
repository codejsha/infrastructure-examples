# Kafka Connect - Connectors

## Kafka Connect REST API

### Plugins

connector plugin list:

```bash
curl --header "Accept:application/json" http://localhost:8083/connector-plugins | jq '.[].class'
http :8083/connector-plugins | jq '.[].class'
```

### Connectors

```sh
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="datagen-pageviews"
CONNECTOR_CONFIG_FILE="datagen-pageviews.json"
```

connector list:

```bash
curl --header "Accept:application/json" http://localhost:8083/connectors | jq
http :8083/connectors | jq
```

create connector:

```sh
curl -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
http POST :8083/connectors Accept:application/json Content-Type:application/json < ${CONNECTOR_CONFIG_FILE}
```

update connector:

```sh
curl -X PUT -H "Content-Type: application/json" -d $(jq -c .config ${CONNECTOR_CONFIG_FILE}) ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}/config
http PUT :8083/connectors/${CONNECTOR_NAME}/config Content-Type:application/json < ${CONNECTOR_CONFIG_FILE}
```

delete connector:

```sh
curl -X DELETE -H "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
http DELETE :8083/connectors/${CONNECTOR_NAME} Accept:application/json
```

connector config:

```bash
curl --header "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}/config | jq -S
http :8083/connectors/${CONNECTOR_NAME}/config | jq -S
```

## References

Confluent:

- Kafka Connect REST Interface for Confluent Platform: <https://docs.confluent.io/platform/current/connect/references/restapi.html>
- Confluent Hub: <https://www.confluent.io/hub/>
- Confluent Open Source / Community / Partner Connectors: <https://www.confluent.io/product/connectors/>
- Kafka Connect Confluent Platform Docs: <https://docs.confluent.io/platform/current/connect/index.html>
- Kafka Connect Worker Configuration Properties for Confluent Platform: <https://docs.confluent.io/platform/current/connect/references/allconfigs.html>
- Connector Configuration Properties for Confluent Platform: <https://docs.confluent.io/platform/current/connect/references/connector-configs.html>

Debezium:

- Debezium Documentation: <https://debezium.io/documentation/>
