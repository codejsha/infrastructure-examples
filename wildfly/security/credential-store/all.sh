#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../../env-base.sh
mkdir -p ${JBOSS_HOME}/credential-store

bash ./create-credential-store.sh --port-offset=0
bash ./create-credential-store.sh --port-offset=1

######################################################################

bash ./add-credentials.sh --port-offset=0 --alias=baseds1-password --secret-value=${PASSWORD}
bash ./add-credentials.sh --port-offset=1 --alias=baseds1-password --secret-value=${PASSWORD}

######################################################################

# bash ./get-credentials.sh --port-offset=0
# bash ./get-credentials.sh --port-offset=1

######################################################################

# bash ./delete-credentials.sh --port-offset=0 --alias=baseds1-password
# bash ./delete-credentials.sh --port-offset=1 --alias=baseds1-password
