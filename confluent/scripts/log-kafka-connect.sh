#!/bin/bash
# Maintained by Ansible

LOG_DIR="/logs/kafka-connect"
LOG_FILE_NAME="connect.log"

tail -f ${LOG_DIR}/${LOG_FILE_NAME}
