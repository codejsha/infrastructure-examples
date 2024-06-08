FROM confluentinc/cp-server-connect:7.0.0

USER root

### source and sink
RUN \
    confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest && \
    echo

USER 1001
