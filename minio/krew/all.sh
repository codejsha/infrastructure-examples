#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

# kubectl -n vault port-forward service/my-vault 8200:8200
# export VAULT_ADDR="https://localhost:8200"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

######################################################################

cd operator/
# bash ./krew-install-minio-operator.sh
bash ./kustomize-install-minio-operator.sh
bash ./get-console-token.sh
# kubectl apply --namespace minio-operator --filename operator-console-ingress.yaml
cd ..

cd istio/
kubectl apply --filename operator-console-traffic-management.yaml
cd ..

######################################################################

cd tenant/
kubectl apply --filename tenant1-namespace.yaml
kubectl apply --filename tenant1-serviceaccount.yaml
kubectl apply --filename tenant1-clusterrolebinding.yaml
cd ..

######################################################################

cd vault/
### roles
bash ./create-kubernetes-role.sh
bash ./create-pki-role.sh

### policies
bash ./create-policy.sh

### issuers
kubectl apply --filename issuer-serviceaccount.yaml
kubectl apply --filename issuer-serviceaccount-secret.yaml
bash ./create-vault-issuer.sh

### certificates
kubectl apply --filename tenant1-certificate.yaml
kubectl apply --filename tenant1-console-certificate.yaml
kubectl apply --filename tenant1-client-certificate.yaml
kubectl apply --filename tenant1-kes-certificate.yaml

### kes
# vault secrets enable -version=2 kv
# vault auth enable approle
bash ./create-kes-role.sh

### kv
# bash ./add-kv-secret.sh
cd ..

######################################################################

cd tenant/
kubectl apply --filename tenant1-creds-secret.yaml
kubectl apply --filename tenant1-console-secret.yaml
# kubectl apply --filename tenant1-console-ingress.yaml
# kubectl apply --filename tenant1-ingress.yaml
# kubectl apply --filename tenant1-env-configuration.yaml
# bash ./create-kes-configuration.sh
# bash ./create-tenant.sh
kubectl apply --filename tenant.yaml
cd ..

cd istio/
kubectl apply --filename tenant1-console-traffic-management.yaml
kubectl apply --filename tenant1-traffic-management.yaml
cd ..
