#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../../env-base.sh
mkdir -p ${JBOSS_HOME}/vault-store

bash ./initialize-password-vault.sh

######################################################################

bash ./encrypt-password-with-password-vault.sh --block=datasource --attribute=password --password=${PASSWORD}
