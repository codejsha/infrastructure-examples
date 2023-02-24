#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" ${HOME}/.vault/cluster-keys.json)
kubectl exec -n vault my-vault-0 -- vault operator unseal ${VAULT_UNSEAL_KEY}

export CLUSTER_ROOT_TOKEN=$(cat ${HOME}/.vault/cluster-keys.json | jq -r ".root_token")
kubectl exec -n vault my-vault-0 -- vault login ${CLUSTER_ROOT_TOKEN}
kubectl exec -n vault my-vault-0 -- vault operator raft list-peers
kubectl exec -n vault my-vault-0 -- vault status
