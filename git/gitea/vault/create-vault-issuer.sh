#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="gitea"

kubectl create serviceaccount --namespace ${NAMESPACE} gitea-issuer
export GITEA_ISSUER_SECRET_REF="$(kubectl get serviceaccount --namespace ${NAMESPACE} gitea-issuer -o json | jq -r ".secrets[].name")"

envsubst < ./vault-issuer.yaml > ./vault-issuer-temp.yaml
kubectl apply --namespace ${NAMESPACE} --filename ./vault-issuer-temp.yaml
