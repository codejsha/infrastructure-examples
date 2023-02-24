#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

vault write auth/kubernetes/role/confluent-operator \
    bound_service_account_names="confluent-sa" \
    bound_service_account_namespaces="confluent" \
    policies="confluent-operator" \
    ttl="8760h"
