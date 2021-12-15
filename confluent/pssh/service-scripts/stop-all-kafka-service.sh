#!/bin/bash

CONFLUENT_HOME="/usr/local/confluent"

pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "sudo systemctl stop confluent-server"
# sshpass -p ${PASSWORD} pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/kafka.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
#     "sudo systemctl stop confluent-server"
