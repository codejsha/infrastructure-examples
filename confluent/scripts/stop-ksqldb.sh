#!/bin/bash
# Maintained by Ansible

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"

PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "io\.confluent\.ksql\.rest\.server\.KsqlServerMain" | awk '{print $1}')"
kill -9 ${PID}
# kill -15 ${PID}

# pkill -9 -ecf "io\.confluent\.ksql\.rest\.server\.KsqlServerMain"
# pkill -15 -ecf "io\.confluent\.ksql\.rest\.server\.KsqlServerMain"
