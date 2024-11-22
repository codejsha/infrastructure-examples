######################################################################

### process

alias killzookeeper="sudo pkill -9 -ecf \"org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain\""
alias killkafka="sudo pkill -9 -ecf \"kafka\.Kafka\""
alias killschemaregistry="sudo pkill -9 -ecf \"io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain\""
alias killkafkaconnect="sudo pkill -9 -ecf \"org\.apache\.kafka\.connect\.cli\.ConnectDistributed\""
alias killkafkarest="sudo pkill -9 -ecf \"io\.confluent\.kafkarest\.KafkaRestMain\""
alias killksqldb="sudo pkill -9 -ecf \"io\.confluent\.ksql\.rest\.server\.KsqlServerMain\""
alias killcontrolcenter="sudo pkill -9 -ecf \"io\.confluent\.controlcenter\.ControlCenter\""

alias killconfluent="killzookeeper; killkafka; killschemaregistry; killkafkaconnect; killkafkarest; killksqldb; killcontrolcenter;"

######################################################################

function cdconfluent() { DIRECTORY="/usr/local/confluent"; echo "+ cd ${DIRECTORY}">&2; command cd ${DIRECTORY} || exit; STATUS="${?}"; if [ "${STATUS}" -eq "0" ]; then ls --almost-all -l; fi; }
