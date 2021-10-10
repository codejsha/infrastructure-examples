#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="http://vault.example.com"
export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

vault write auth/kubernetes/role/confluent-operator \
    bound_service_account_names="confluent-sa" \
    bound_service_account_namespaces="confluent" \
    policies="confluent-operator" \
    ttl="4380h"
