#!/usr/bin/bash

source ./env-base.sh

export NODEMGR_NAME=${1}
export NODEMGR_LISTEN_ADDRESS=${2}
export NODEMGR_LISTEN_PORT=${3}

mkdir -p ${LOG_HOME}/nodemanager

export CONFIG_JVM_ARGS="${CONFIG_JVM_ARGS} -Djava.security.egd=file:///dev/urandom"
if [ "${MAJOR_RELEASE}" == "11g" ]; then
    ${MW_HOME}/wlserver_10.3/common/bin/wlst.sh create_nodemgr.py
elif [ "${MAJOR_RELEASE}" == "12c" ] && [ "${MAJOR_RELEASE}" == "14c" ]; then
    ${ORACLE_HOME}/oracle_common/common/bin/wlst.sh create_nodemgr.py
fi
