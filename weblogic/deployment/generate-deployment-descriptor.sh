#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../env-base.sh

APP_PATH="${1}"

mkdir -p ${APP_PATH}/WEB-INF

######################################################################

function generate_deployment_descriptor {
    ${JAVA_HOME}/bin/java \
        -cp ${WL_HOME}/server/lib/weblogic.jar weblogic.marathon.ddinit.WebInit \
        ${APP_PATH}
}

######################################################################

generate_deployment_descriptor
