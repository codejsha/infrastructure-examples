#!/bin/bash
# Maintained by Ansible (custom)
set -o xtrace

LOG_DIR="/logs/kafka"
LOG_FILE_NAME="server.log"

tail -f ${LOG_DIR}/${LOG_FILE_NAME}
