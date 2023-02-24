#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

vault write pki_int/roles/minio-operator \
    allowed_domains="operator.minio-operator.svc,localhost,operator,operator.minio-operator,operator.minio-operator.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"
