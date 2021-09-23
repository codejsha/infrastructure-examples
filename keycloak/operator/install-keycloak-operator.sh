#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.18.3/install.sh | bash -s v0.18.3
kubectl apply -f https://operatorhub.io/install/keycloak-operator.yaml
