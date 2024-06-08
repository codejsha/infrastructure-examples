#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update

export PASSWORD="${PASSWORD}"

envsubst < ./values.yaml > ./values-temp.yaml

NAMESPACE="wildfly-system"

# helm install my-wildfly \
helm upgrade --install my-wildfly \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --version 1.4.1 \
    wildfly/wildfly
