#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

confluent local services control-center stop
confluent local services ksql-server stop
confluent local services kafka-rest stop
confluent local services connect stop
confluent local services schema-registry stop
confluent local services kafka stop
confluent local services zookeeper stop
