######################################################################
### confluent kafka
######################################################################

### broker version

./kafka-broker-api-versions --version

./kafka-broker-api-versions \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --version

./kafka-broker-api-versions \
    --bootstrap-server kafka1.example.com:9092,kafka2.example.com:9092,kafka3.example.com:9092 \
    --command-config /opt/confluent/etc/kafka/client.properties \
    --version
