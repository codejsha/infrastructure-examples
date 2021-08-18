#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update

export PASSWORD="${PASSWORD}"

envsubst < ./values.yaml > ./values-temp.yaml

NAMESPACE="wildfly-system"

function helm_install_bitnami_wildfly {
    # helm install my-wildfly \
    helm upgrade --install my-wildfly \
        --create-namespace \
        --namespace ${NAMESPACE} \
        --values values-temp.yaml \
        --version 8.2.3 \
        bitnami/wildfly
}

function helm_install_wildfly {
    # helm install my-wildfly \
    helm upgrade --install my-wildfly \
        --create-namespace \
        --namespace ${NAMESPACE} \
        --version 1.4.1 \
        wildfly/wildfly
}

helm_install_bitnami_wildfly
# helm_install_wildfly
