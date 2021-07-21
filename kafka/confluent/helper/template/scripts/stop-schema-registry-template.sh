#!/bin/bash

# CONFLUENT_HOME=""

# ${CONFLUENT_HOME}/bin/schema-registry-stop

# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

pkill -9 -ecf "io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain"
# pkill -15 -ecf "io\.confluent\.kafka\.schemaregistry\.rest\.SchemaRegistryMain"
