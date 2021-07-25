#!/bin/bash

### get root token
# VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"
# echo ${VAULT_TOKEN}

### connect to running container
# NAMESPACE="vault-system"
# VAULT_PODNAME="$(kubectl get pods --namespace ${NAMESPACE} --selector app.kubernetes.io/name=vault --output custom-columns=:metadata.name)"
# kubectl exec -it --namespace ${NAMESPACE} ${VAULT_PODNAME} --container vault -- /bin/sh
# export VAULT_TOKEN="<vault_token_string>"

### enable pki
vault secrets enable pki
vault secrets tune -max-lease-ttl=87600h pki

### generate root ca
vault write pki/root/generate/internal \
    common_name=example.com \
    ttl=87600h

### configure issuing certificate and crl endpoints
vault write pki/config/urls \
    issuing_certificates="http://127.0.0.1:8200/v1/pki/ca" \
    crl_distribution_points="http://127.0.0.1:8200/v1/pki/crl"

### create policy
vault policy write pki - <<EOF
path "pki*"          { capabilities = ["read", "list"] }
path "pki/roles/*"   { capabilities = ["create", "update"] }
path "pki/sign/*"    { capabilities = ["create", "update"] }
path "pki/issue/*"   { capabilities = ["create"] }
EOF
