#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"
export VAULT_ADDR="http://vault.example.com"

### enable pki
vault secrets enable pki
vault secrets tune -max-lease-ttl=87600h pki

### generate root ca
vault write pki/root/generate/internal \
    common_name=example.com \
    ttl=87600h

### configure issuing certificate and crl endpoints
vault write pki/config/urls \
    issuing_certificates="http://vault.example.com/v1/pki/ca" \
    crl_distribution_points="http://vault.example.com/v1/pki/crl"

### create policy
vault policy write pki - <<EOF
path "pki*"          { capabilities = ["read", "list"] }
path "pki/roles/*"   { capabilities = ["create", "update"] }
path "pki/sign/*"    { capabilities = ["create", "update"] }
path "pki/issue/*"   { capabilities = ["create"] }
EOF
