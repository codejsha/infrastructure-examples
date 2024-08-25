#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

CMAK_HOME="/usr/local/cmak"
CONFIG_FILE="${CMAK_HOME}/config/application.conf"
LOG_FILE="${CMAK_HOME}/nohup.cmak.out"

${CMAK_HOME}/bin/cmak -Dconfig.file=${CONFIG_FILE} -Dhttp.port=9000 > ${LOG_FILE} 2>&1 &
