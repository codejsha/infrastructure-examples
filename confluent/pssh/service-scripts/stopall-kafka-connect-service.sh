#!/bin/bash

CONFLUENT_BASE_DIR="/opt/confluent"

pssh --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-connect.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "sudo systemctl stop confluent-kafka-connect"
# sshpass -p ${PASSWORD} pssh --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-connect.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
#     "sudo systemctl stop confluent-kafka-connect"
