#!/bin/bash

export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"
export VAULT_ADDR="http://vault.example.com"

vault write pki/roles/minio-tenant \
    allowed_domains=minio-tenant-1.example.com,minio,minio.minio-tenant,minio.minio-tenant.svc.cluster.local,*.minio.minio-tenant.svc.cluster.local,minio-tenant-1-hl,minio-tenant-1-hl.minio-tenant,minio-tenant-1-hl.minio-tenant.svc.cluster.local,*.minio-tenant-1-hl.minio-tenant.svc.cluster.local \
    allow_subdomains=true \
    allow_bare_domains=true \
    allow_glob_domains=true \
    max_ttl=4380h

vault write pki/roles/minio-tenant-console \
    allowed_domains=minio-tenant-1-console.example.com,minio-tenant-1-console,minio-tenant-1-console.minio-tenant,minio-tenant-1-console.minio-tenant.svc.cluster.local \
    allow_subdomains=true \
    allow_bare_domains=true \
    allow_glob_domains=true \
    max_ttl=4380h
