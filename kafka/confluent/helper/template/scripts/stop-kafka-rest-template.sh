#!/bin/bash

# CONFLUENT_HOME=""

# ${CONFLUENT_HOME}/bin/kafka-rest-stop

# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "io\.confluent\.kafkarest\.KafkaRestMain" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

pkill -9 -ecf "io\.confluent\.kafkarest\.KafkaRestMain"
# pkill -15 -ecf "io\.confluent\.kafkarest\.KafkaRestMain"
