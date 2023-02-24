#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

NAMESPACE="vault"
KUBERNETES_HOST_URL="https://kubernetes.docker.internal:6443"

vault auth enable kubernetes
kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault write auth/kubernetes/config \
    kubernetes_host="${KUBERNETES_HOST_URL}" \
    issuer="https://kubernetes.default.svc.cluster.local"

vault read auth/kubernetes/config
# vault read -field disable_iss_validation auth/kubernetes/config
