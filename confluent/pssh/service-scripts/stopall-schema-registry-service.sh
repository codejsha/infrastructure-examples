#!/bin/bash

CONFLUENT_BASE_DIR="/opt/confluent"

pssh --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/schema-registry.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "sudo systemctl stop confluent-schema-registry"
# sshpass -p ${PASSWORD} pssh --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/schema-registry.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
#     "sudo systemctl stop confluent-schema-registry"
