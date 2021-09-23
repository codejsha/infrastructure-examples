#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"
export VAULT_ADDR="http://vault.example.com"

vault write pki/roles/keycloak \
    allowed_domains=keycloak.example.com,keycloak,keycloak.keycloak-system,keycloak.keycloak-system.svc.cluster.local,*.keycloak.keycloak-system.svc.cluster.local \
    allow_subdomains=true \
    allow_bare_domains=true \
    allow_glob_domains=true \
    max_ttl=4380h
