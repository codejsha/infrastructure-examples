#!/bin/bash

source ./env-base.sh
source ./env-component.sh

ORACLE_HOME="${ORACLE_HOME}"

export CONFIG_JVM_ARGS="${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"

${ORACLE_HOME}/oracle_common/common/bin/wlst.sh create_component.py
