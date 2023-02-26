#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="argocd"

export ARGOCD_ISSUER_SECRET_REF="$(kubectl get secrets --namespace ${NAMESPACE} --output=json | jq -r '.items[].metadata | select(.name|startswith("argocd-issuer-secret")).name')"
export BASE64_ENCODED_CABUNDLE="$(kubectl get secrets vault-ha-tls --namespace vault --output jsonpath='{.data.kubernetes-ca\.crt}')"

envsubst < ./issuer.yaml > ./issuer-temp.yaml
kubectl apply --namespace ${NAMESPACE} --filename ./issuer-temp.yaml
