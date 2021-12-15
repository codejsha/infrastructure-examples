#!/bin/bash

CONFLUENT_HOME="/usr/local/confluent"

pssh --hosts=${CONFLUENT_HOME}/pssh/hosts/replicator.hosts --askpass --inline --timeout=5 --option=StrictHostKeyChecking=no \
    "${CONFLUENT_HOME}/scripts/start.sh"
