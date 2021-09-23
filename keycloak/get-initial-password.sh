#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl get secret --namespace keycloak-system --output json credential-my-keycloak \
    | jq ".data.ADMIN_PASSWORD" | tr -d '"' | base64 -d

echo
