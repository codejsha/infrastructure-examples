#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

git clone https://github.com/backstage/backstage.git
# gh repo clone backstage/backstage

cd backstage/contrib/chart/backstage
helm dependency update

NAMESPACE="backstage"

# helm install my-backstage \
helm upgrade --install my-backstage \
    --create-namespace \
    --namespace ${NAMESPACE} \
    .
