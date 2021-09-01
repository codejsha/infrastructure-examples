#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

kubectl patch service --namespace apicurio-system my-registry-service --patch-file patch-registry-service-nodeport.yaml
