#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# cd helm
# bash ./helm-install-vault-ha-tls.sh
# cd ..

bash ./init-vault-server.sh

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

# kubectl -n vault port-forward service/my-vault 8200:8200
# export VAULT_ADDR="https://localhost:8200"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

cd istio
kubectl apply -f vault-traffic-management.yaml
# kubectl apply -f vault-traffic-management-http.yaml
cd ..

cd pki
bash ./generate-root-ca.sh
bash ./generate-intermediate-ca.sh
cd ..

cd kubernetes
bash ./enable-kubernetes-auth-method.sh
vault secrets enable -version=2 kv
vault auth enable approle
cd ..
