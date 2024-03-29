#!/bin/bash
# Maintained by Ansible (custom)

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"

PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "org\.apache\.kafka\.connect\.cli\.ConnectDistributed" | awk '{print $1}')"
kill -9 ${PID}
# kill -15 ${PID}

# pkill -9 -ecf "org\.apache\.kafka\.connect\.cli\.ConnectDistributed"
# pkill -15 -ecf "org\.apache\.kafka\.connect\.cli\.ConnectDistributed"
