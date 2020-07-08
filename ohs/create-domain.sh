#!/usr/bin/bash

ORACLE_HOME="/usr/local/ohs"
INSTALL_SCRIPT_DIR="/svc/infrastructure/ohs"

export CONFIG_JVM_ARGS="${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"

function ohs_create_domain_12cr1 {
    ${ORACLE_HOME}/oracle_common/common/bin/wlst.sh ${INSTALL_SCRIPT_DIR}/create_domain_12cr1.py
}

function ohs_create_domain {
    ${ORACLE_HOME}/oracle_common/common/bin/wlst.sh ${INSTALL_SCRIPT_DIR}/create_domain.py
}

# ohs_create_domain_12cr1
ohs_create_domain