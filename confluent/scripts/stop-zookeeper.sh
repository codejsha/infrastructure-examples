#!/bin/bash

# CONFLUENT_HOME="/usr/local/confluent"
# ${CONFLUENT_HOME}/bin/zookeeper-server-stop

# CONFLUENT_HOME="/usr/local/confluent"
# PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain" | awk '{print $1}')"
# kill -9 ${PID}
# kill -15 ${PID}

pkill -9 -ecf "org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain"
# pkill -15 -ecf "org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain"
