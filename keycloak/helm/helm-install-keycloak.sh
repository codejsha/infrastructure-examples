#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update

export PASSWORD="${PASSWORD}"

envsubst < ./values.yaml > ./values-temp.yaml

NAMESPACE="keycloak-system"

# helm install my-keycloak \
helm upgrade --install my-keycloak \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 5.0.5 \
    bitnami/keycloak
