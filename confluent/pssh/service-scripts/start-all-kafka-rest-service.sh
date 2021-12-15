#!/bin/bash

CONFLUENT_HOME="/usr/local/confluent"

pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka-rest.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "sudo systemctl start confluent-kafka-rest"
# sshpass -p ${PASSWORD} pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka-rest.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
#     "sudo systemctl start confluent-kafka-rest"
