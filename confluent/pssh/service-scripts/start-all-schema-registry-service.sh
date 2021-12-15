#!/bin/bash

CONFLUENT_HOME="/usr/local/confluent"

pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/schema-registry.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "sudo systemctl start confluent-schema-registry"
# sshpass -p ${PASSWORD} pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/schema-registry.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
#     "sudo systemctl start confluent-schema-registry"
