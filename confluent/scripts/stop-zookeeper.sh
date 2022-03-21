#!/bin/bash
# Maintained by Ansible

CONFLUENT_HOME="/opt/confluent/confluent-7.0.1"

PID="$(pgrep -xa java | grep ${CONFLUENT_HOME} | grep "org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain" | awk '{print $1}')"
kill -9 ${PID}
# kill -15 ${PID}

# pkill -9 -ecf "org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain"
# pkill -15 -ecf "org\.apache\.zookeeper\.server\.quorum\.QuorumPeerMain"
