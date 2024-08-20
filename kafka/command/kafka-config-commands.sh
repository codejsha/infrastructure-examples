######################################################################
### apache kafka
######################################################################

### describe topic

kafka-configs.sh \
    --bootstrap-server localhost:9092 \
    --entity-type topics \
    --entity-name my-topic \
    --describe

alias dce="docker compose exec"
dce kafka-client kafka-configs.sh --bootstrap-server kafka-broker:9092 --entity-type topics --entity-name my.topic --describe
