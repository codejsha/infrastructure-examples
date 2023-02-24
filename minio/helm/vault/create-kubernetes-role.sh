#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

vault write auth/kubernetes/role/minio-tenant-issuer \
    bound_service_account_names="minio-tenant-issuer" \
    bound_service_account_namespaces="minio-tenant-1" \
    policies="pki_int" \
    ttl="8760h"

vault write auth/kubernetes/role/minio-tenant-console-issuer \
    bound_service_account_names="minio-tenant-console-issuer" \
    bound_service_account_namespaces="minio-tenant-1" \
    policies="pki_int" \
    ttl="8760h"

vault write auth/kubernetes/role/minio-tenant-kes-issuer \
    bound_service_account_names="minio-tenant-kes-issuer" \
    bound_service_account_namespaces="minio-tenant-1" \
    policies="pki_int" \
    ttl="8760h"

vault write auth/kubernetes/role/minio-service-account \
    bound_service_account_names="minio-service-account" \
    bound_service_account_namespaces="minio-tenant-1" \
    policies="minio1-policy" \
    ttl="8760h"
