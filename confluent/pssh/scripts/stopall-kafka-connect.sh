#!/bin/bash

CONFLUENT_BASE_DIR="/opt/confluent"

pssh --hosts=${CONFLUENT_BASE_DIR}/pssh/hosts/kafka-connect.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "${CONFLUENT_BASE_DIR}/scripts/stop.sh"
