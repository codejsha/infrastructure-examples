#!/bin/bash
# Maintained by Ansible (custom)

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"

PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain" | awk '{print $1}')"
kill -9 ${PID}
# kill -15 ${PID}

# pkill -9 -ecf "io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain"
# pkill -15 -ecf "io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain"
