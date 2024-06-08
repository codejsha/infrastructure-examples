FROM confluentinc/cp-server-connect:7.0.0

USER root

### source
RUN \
    confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest && \
    echo

USER 1001
