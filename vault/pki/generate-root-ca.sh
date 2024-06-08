#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

### enable pki
vault secrets enable pki
vault secrets tune -max-lease-ttl="87600h" pki

### generate root ca
vault write pki/root/generate/internal \
    common_name="Example Root CA" \
    ttl="87600h" \
    > ca.crt

### configure issuing certificate and crl endpoints
vault write pki/config/urls \
    issuing_certificates="https://vault.example.com/v1/pki/ca" \
    crl_distribution_points="https://vault.example.com/v1/pki/crl"

### create policy
vault policy write pki - <<EOF
path "pki*"          { capabilities = ["read", "list"] }
path "pki/roles/*"   { capabilities = ["create", "update"] }
path "pki/sign/*"    { capabilities = ["create", "update"] }
path "pki/issue/*"   { capabilities = ["create"] }
EOF
