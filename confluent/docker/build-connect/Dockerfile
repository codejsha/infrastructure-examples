FROM confluentinc/cp-server-connect:7.0.0

USER root

### source
RUN \
    confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-s3-source:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-azure-blob-storage-source:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-gcs-source:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs3-source:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-jms:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-oracle-cdc:latest && \
    confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest && \
    confluent-hub install --no-prompt debezium/debezium-connector-mysql:latest && \
    confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest && \
    confluent-hub install --no-prompt debezium/debezium-connector-mongodb:latest && \
    confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:latest && \
    echo

### sink
RUN \
    confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-azure-blob-storage:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-gcs:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs3:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-http:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-cassandra:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-jms-sink:latest && \
    confluent-hub install --no-prompt wepay/kafka-connect-bigquery:latest && \
    echo

### source and sink
RUN \
    confluent-hub install --no-prompt confluentinc/kafka-connect-replicator:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-influxdb:latest && \
    confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-sftp:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-ftps:latest && \
    echo

USER 1001
