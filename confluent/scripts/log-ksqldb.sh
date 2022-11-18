#!/bin/bash
# Maintained by Ansible (custom)
set -o xtrace

LOG_DIR="/logs/ksqldb"
LOG_FILE_NAME="ksql.log"

tail -f ${LOG_DIR}/${LOG_FILE_NAME}
