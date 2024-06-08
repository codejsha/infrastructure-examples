#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

######################################################################

cd operator/
bash ./helm-install-minio-operator.sh
# kubectl apply --namespace minio-operator --filename operator-console-ingress.yaml
bash ./create-kubernetes-role.sh
bash ./create-pki-role.sh
kubectl apply --filename issuer-serviceaccount.yaml
bash ./create-issuer.sh
kubectl apply --filename operator-certificate.yaml
bash ./patch-operator-secret.sh
bash ./get-console-token.sh
cd ..

cd istio/
kubectl apply --filename operator-console-traffic-management.yaml
cd ..

######################################################################

cd tenant/
kubectl apply --filename tenant1-namespace.yaml
kubectl apply --filename tenant1-serviceaccount.yaml
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
bash ./create-issuer.sh

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
kubectl apply --filename tenant1-env-configuration.yaml
bash ./create-kes-configuration.sh
bash ./helm-install-minio-tenant1.sh
cd ..

cd istio/
kubectl apply --filename tenant1-console-traffic-management.yaml
kubectl apply --filename tenant1-traffic-management.yaml
cd ..
