#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

ALIAS="servercert"
KEYSTORE_PATH="${JBOSS_HOME}/keystore/keystore.jks"
KEYSTORE_PASSWORD="changeit"
