#!/bin/bash

CONFLUENT_BASE_DIR="/opt/confluent"

pssh \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/zookeeper.hosts \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka.hosts \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/schema-registry.hosts \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-connect.hosts \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/replicator.hosts \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-rest.hosts \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/ksqldb.hosts \
    --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/control-center.hosts \
    --askpass \
    --inline \
    --timeout=5 \
    --option=StrictHostKeyChecking=no \
    "pkill -9 -ecx java"

# sshpass -p ${PASSWORD} \
#     pssh \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/zookeeper.hosts \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka.hosts \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/schema-registry.hosts \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-connect.hosts \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/replicator.hosts \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-rest.hosts \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/ksqldb.hosts \
#     --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/control-center.hosts \
#     --askpass \
#     --inline \
#     --timeout=5 \
#     --option=StrictHostKeyChecking=no \
#     "pkill -9 -ecx java"
