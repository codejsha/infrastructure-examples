#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update

NAMESPACE="external-dns"

# helm install my-etcd \
helm upgrade --install my-etcd \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 6.1.3 \
    bitnami/etcd
