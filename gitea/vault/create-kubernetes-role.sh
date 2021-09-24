#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="http://vault.example.com"
export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

vault write auth/kubernetes/role/gitea-issuer \
    bound_service_account_names=issuer,gitea-issuer \
    bound_service_account_namespaces=gitea-system \
    policies=pki \
    ttl=4860h
