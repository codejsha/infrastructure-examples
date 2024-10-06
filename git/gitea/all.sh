#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

cd helm
./helm-install-gitea.sh
cd ..

kubectl apply --filename gitea-namespace.yaml

cd istio
kubectl apply --filename gitea-traffic-management.yaml
cd ..

cd vault
bash ./create-kubernetes-role.sh
bash ./create-pki-role.sh
kubectl apply --filename issuer-serviceaccount.yaml
bash ./create-issuer.sh
kubectl apply --filename gitea-certificate.yaml
cd ..
