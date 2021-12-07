#!/bin/bash

# CONFLUENT_HOME="/usr/local/confluent"
# ${CONFLUENT_HOME}/bin/ksql-server-stop

# CONFLUENT_HOME="/usr/local/confluent"
# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "io\.confluent\.ksql\.rest\.server\.KsqlServerMain" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

pkill -9 -ecf "io\.confluent\.ksql\.rest\.server\.KsqlServerMain"
# pkill -15 -ecf "io\.confluent\.ksql\.rest\.server\.KsqlServerMain"
