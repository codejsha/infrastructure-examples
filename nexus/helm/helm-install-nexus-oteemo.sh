#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add oteemocharts https://oteemo.github.io/charts
# helm repo update

NAMESPACE="nexus"

# helm install my-nexus \
helm upgrade --install my-nexus \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values-oteemo.yaml \
    --version 5.2.0 \
    oteemocharts/sonatype-nexus
