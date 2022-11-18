#!/bin/bash
# Maintained by Ansible (custom)
set -o xtrace

LOG_DIR="/logs/zookeeper"
LOG_FILE_NAME="zookeeper-server.log"

tail -f ${LOG_DIR}/${LOG_FILE_NAME}
