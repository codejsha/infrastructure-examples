#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="kafka"

# helm install my-kafka \
helm upgrade --install my-kafka \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 12.4.3 \
    bitnami/kafka
