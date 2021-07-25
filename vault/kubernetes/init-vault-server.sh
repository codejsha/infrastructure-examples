#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="vault-system"

mkdir -p ~/.vault
kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator init > ~/.vault/unseal_keys_and_root_token.txt
