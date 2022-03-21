#!/bin/bash
# Maintained by Ansible

LOG_DIR="/logs/control-center"
LOG_FILE_NAME="control-center.log"

tail -f ${LOG_DIR}/${LOG_FILE_NAME}
