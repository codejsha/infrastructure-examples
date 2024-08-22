######################################################################
### apache kafka
######################################################################

### broker version

kafka-broker-api-versions.sh --version
kafka-broker-api-versions.sh --bootstrap-server localhost:9092 --version

alias dce="docker compose exec"
dce kafka-client kafka-broker-api-versions.sh --bootstrap-server kafka-broker:9092 --version
