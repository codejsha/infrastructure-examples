#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

TENANT_NAME="minio1"
NAMESPACE="minio-tenant-1"

######################################################################

kubectl apply --filename tenant1-namespace.yaml
kubectl minio tenant create \
    ${TENANT_NAME} \
    --namespace ${NAMESPACE} \
    --pool pool-0 \
    --servers 1 \
    --volumes 1 \
    --capacity 4Ti \
    --storage-class hostpath \
    --output > tenant1-temp.yaml

######################################################################

### delete
# kubectl minio tenant delete ${TENANT_NAME} --namespace ${NAMESPACE}
