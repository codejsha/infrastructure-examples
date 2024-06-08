######################################################################
### apache kafka
######################################################################

### describe topic
./kafka-configs.sh \
    --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
    --entity-type topics \
    --entity-name my-topic \
    --describe
