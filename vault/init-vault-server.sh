#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="vault-system"

mkdir -p ~/.vault

kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator init -format="json" > ~/.vault/init-keys.json
cat ~/.vault/init-keys.json | jq -r ".root_token" > ~/.vault/root_token.txt
