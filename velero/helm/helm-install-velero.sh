#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts
# helm repo update

NAMESPACE="velero"
kubectl create namespace ${NAMESPACE}

# helm install my-velero \
helm upgrade --install my-velero \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --version 2.23.8 \
    vmware-tanzu/velero
