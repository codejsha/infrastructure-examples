#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

mkdir -p ${HOME}/.minio
vault write auth/approle/role/minio1-kes token_num_uses=0 secret_id_num_uses=0 period=5m
vault write auth/approle/role/minio1-kes policies=minio1-policy
vault read auth/approle/role/minio1-kes/role-id | grep role_id | awk '{print $2}' > ${HOME}/.minio/tenant1-kes-approle-id.txt
vault write -f auth/approle/role/minio1-kes/secret-id | grep -m 1 secret_id | awk '{print $2}' > ${HOME}/.minio/tenant1-kes-approle-secret-id.txt
