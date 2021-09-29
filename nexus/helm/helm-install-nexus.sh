#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add sonatype https://sonatype.github.io/helm3-charts
# helm repo update

NAMESPACE="nexus"

# helm install my-nexus \
helm upgrade --install my-nexus \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 33.0.0 \
    sonatype/nexus-repository-manager
