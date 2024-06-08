#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update

export PASSWORD="postgres"

envsubst < ./values.yaml > ./values-temp.yaml

######################################################################

function helm_install_postgresql_harbor() {
    local NAMESPACE="harbor"

    # helm install my-harbor-postgres \
    helm upgrade --install my-harbor-postgres \
        --create-namespace \
        --namespace ${NAMESPACE} \
        --values values-temp.yaml \
        --values values-harbor.yaml \
        bitnami/postgresql
}

######################################################################

helm_install_postgresql_harbor
