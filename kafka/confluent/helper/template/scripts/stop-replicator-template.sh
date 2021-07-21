#!/bin/bash

# CONFLUENT_HOME=""

# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "org\.apache\.kafka\.connect\.cli\.ConnectDistributed" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

pkill -9 -ecf "org\.apache\.kafka\.connect\.cli\.ConnectDistributed"
# pkill -15 -ecf "org\.apache\.kafka\.connect\.cli\.ConnectDistributed"

# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "io\.confluent\.connect\.replicator\.ReplicatorApp" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

# pkill -9 -ecf "io\.confluent\.connect\.replicator\.ReplicatorApp"
# pkill -15 -ecf "io\.confluent\.connect\.replicator\.ReplicatorApp"
