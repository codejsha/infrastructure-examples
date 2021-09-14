#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# bash ./delete-mgmt-realm-auth-local.sh --port-offset=0
# bash ./delete-mgmt-realm-auth-local.sh --port-offset=1

######################################################################

bash ./add-certificate-realm.sh --port-offset=0
bash ./add-certificate-realm.sh --port-offset=1

######################################################################

bash ./set-https-listener-certificate-realm.sh --port-offset=0
bash ./set-https-listener-certificate-realm.sh --port-offset=1
