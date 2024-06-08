#!/bin/bash

CONFLUENT_BASE_DIR="/opt/confluent"

pssh --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-rest.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "sudo systemctl stop confluent-kafka-rest"
# sshpass -p ${PASSWORD} pssh --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-rest.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
#     "sudo systemctl stop confluent-kafka-rest"
