#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

confluent local services zookeeper start
confluent local services kafka start
confluent local services schema-registry start
confluent local services connect start
confluent local services kafka-rest start
confluent local services ksql-server start
confluent local services control-center start

######################################################################

# rm -rf /tmp/confluent.*
# confluent local services zookeeper start --config zookeeper.properties
# confluent local services kafka start --config kafka.properties
# confluent local services schema-registry start --config schema-registry.properties
# confluent local services connect start --config kafka-connect.properties
# confluent local services kafka-rest start --config kafka-rest.properties
# confluent local services ksql-server start --config ksqldb.properties
# confluent local services control-center start --config control-center.properties
