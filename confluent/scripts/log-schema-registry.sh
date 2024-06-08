#!/bin/bash
# Maintained by Ansible (custom)
set -o xtrace

LOG_DIR="/logs/schema-registry"
LOG_FILE_NAME="schema-registry.log"

tail -f ${LOG_DIR}/${LOG_FILE_NAME}
