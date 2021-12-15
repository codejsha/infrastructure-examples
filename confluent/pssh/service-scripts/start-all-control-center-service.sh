#!/bin/bash

CONFLUENT_HOME="/usr/local/confluent"

pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/control-center.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "sudo systemctl start confluent-control-center"
# sshpass -p ${PASSWORD} pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/control-center.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
#     "sudo systemctl start confluent-control-center"
