#!/usr/bin/bash

ORACLE_HOME="/usr/local/ohs"
INSTALL_SCRIPT_DIR="/svc/infrastructure/ohs"

export CONFIG_JVM_ARGS="${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"

${ORACLE_HOME}/oracle_common/common/bin/wlst.sh ${INSTALL_SCRIPT_DIR}/create_component.py
