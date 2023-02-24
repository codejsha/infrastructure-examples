#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

vault write pki_int/roles/minio1 \
    allowed_domains="minio1.example.com,localhost,minio,minio.minio-tenant-1,minio.minio-tenant-1.svc,minio.minio-tenant-1.svc.cluster.local,*.minio1-hl,*.minio1-hl.minio-tenant-1,*.minio1-hl.minio-tenant-1.svc,*.minio1-hl.minio-tenant-1.svc.cluster.local,*.minio-tenant-1.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/minio1-console \
    allowed_domains="minio1-console.example.com,localhost,minio1-console,minio1-console.minio-tenant-1,minio1-console.minio-tenant-1.svc,minio1-console.minio-tenant-1.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"

vault write pki_int/roles/minio1-kes \
    allowed_domains="minio1-kes.example.com,localhost,*.minio1-kes-hl-svc,*.minio1-kes-hl-svc.minio-tenant-1,*.minio1-kes-hl-svc.minio-tenant-1.svc,*.minio1-kes-hl-svc.minio-tenant-1.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"
