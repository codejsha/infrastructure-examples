#!/bin/bash

# CONFLUENT_HOME="/usr/local/confluent"
# ${CONFLUENT_HOME}/bin/kafka-server-stop

# CONFLUENT_HOME="/usr/local/confluent"
# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "kafka\.Kafka" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

pkill -9 -ecf "kafka\.Kafka"
# pkill -15 -ecf "kafka\.Kafka"
