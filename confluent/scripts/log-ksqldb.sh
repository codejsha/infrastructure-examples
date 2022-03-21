#!/bin/bash
# Maintained by Ansible

LOG_DIR="/logs/ksqldb"
LOG_FILE_NAME="ksql.log"

tail -f ${LOG_DIR}/${LOG_FILE_NAME}
