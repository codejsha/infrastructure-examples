#!/bin/bash

CONFLUENT_HOME="/usr/local/confluent"

pssh \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/zookeeper.hosts \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka.hosts \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/schema-registry.hosts \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka-connect.hosts \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/replicator.hosts \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka-rest.hosts \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/ksqldb.hosts \
    --hosts=${CONFLUENT_HOME}/pssh/hosts/control-center.hosts \
    --askpass \
    --inline \
    --timeout=5 \
    --options=StrictHostKeyChecking=no \
    "pkill -9 -ecx java"

# sshpass -p ${PASSWORD} \
#     pssh \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/zookeeper.hosts \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka.hosts \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/schema-registry.hosts \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka-connect.hosts \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/replicator.hosts \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka-rest.hosts \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/ksqldb.hosts \
#     --hosts=${CONFLUENT_HOME}/pssh/hosts/control-center.hosts \
#     --askpass \
#     --inline \
#     --timeout=5 \
#     --options=StrictHostKeyChecking=no \
#     "pkill -9 -ecx java"
