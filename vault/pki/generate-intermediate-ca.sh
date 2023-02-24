#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

### enable pki
vault secrets enable -path="pki_int" pki
vault secrets tune -max-lease-ttl="87600h" pki_int

### generate csr and private key
vault write -format="json" pki_int/intermediate/generate/exported \
    common_name="Example Intermediate Authority" \
    > request_intermediate.json

jq -r '.data.csr' < request_intermediate.json > intermediate.csr
jq -r '.data.private_key' < request_intermediate.json > intermediate.key

### sign intermediate certificate
vault write -format="json" pki/root/sign-intermediate \
    csr=@intermediate.csr \
    format="pem_bundle" \
    ttl="43800h" \
    > signed_intermediate.json

jq -r '.data.certificate' < signed_intermediate.json > intermediate.crt
jq -r '.data.issuing_ca' < signed_intermediate.json > ca.crt

### import into vault
vault write pki_int/intermediate/set-signed \
    certificate=@intermediate.crt

### create policy
vault policy write pki_int - <<EOF
path "pki_int*"          { capabilities = ["read", "list"] }
path "pki_int/roles/*"   { capabilities = ["create", "update"] }
path "pki_int/sign/*"    { capabilities = ["create", "update"] }
path "pki_int/issue/*"   { capabilities = ["create"] }
EOF

cat intermediate.crt > intermediate.chain.crt
cat ca.crt >> intermediate.chain.crt

# openssl x509 -in intermediate.crt -text -noout
# openssl x509 -in intermediate.chain.crt -text -noout
