#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="minio-tenant"

kubectl create serviceaccount --namespace ${NAMESPACE} minio-tenant-issuer
kubectl create serviceaccount --namespace ${NAMESPACE} minio-tenant-console-issuer

export MINIO_TENANT_ISSUER_SECRET_REF="$(kubectl get serviceaccount --namespace ${NAMESPACE} minio-tenant-issuer -o json | jq -r ".secrets[].name")"
export MINIO_TENANT_CONSONE_ISSUER_SECRET_REF="$(kubectl get serviceaccount --namespace ${NAMESPACE} minio-tenant-console-issuer -o json | jq -r ".secrets[].name")"

envsubst < ./vault-issuer.yaml > ./vault-issuer-temp.yaml
kubectl apply --namespace ${NAMESPACE} --filename ./vault-issuer-temp.yaml
