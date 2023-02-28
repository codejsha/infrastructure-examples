#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="minio-tenant-1"

export MINIO_TENANT_ISSUER_SECRET_REF="$(kubectl get secrets --namespace ${NAMESPACE} --output=json | jq -r '.items[].metadata | select(.name|startswith("minio-tenant-issuer-secret")).name')"
export MINIO_TENANT_CONSONE_ISSUER_SECRET_REF="$(kubectl get secrets --namespace ${NAMESPACE} --output=json | jq -r '.items[].metadata | select(.name|startswith("minio-tenant-console-issuer-secret")).name')"
export MINIO_TENANT_KES_ISSUER_SECRET_REF="$(kubectl get secrets --namespace ${NAMESPACE} --output=json | jq -r '.items[].metadata | select(.name|startswith("minio-tenant-kes-issuer-secret")).name')"
export BASE64_ENCODED_CABUNDLE="$(kubectl get secrets vault-ha-tls --namespace vault --output jsonpath='{.data.kubernetes-ca\.crt}')"

envsubst < ./issuer.yaml > ./issuer-temp.yaml
kubectl apply --namespace ${NAMESPACE} --filename ./issuer-temp.yaml
