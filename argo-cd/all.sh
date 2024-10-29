#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

kubectl apply --filename argocd-namespace.yaml

cd vault
bash ./create-kubernetes-role.sh
bash ./create-pki-role.sh
cd ..

cd cert
kubectl apply --filename issuer-serviceaccount.yaml
bash ./create-issuer.sh
kubectl apply --filename argocd-certificate.yaml
kubectl apply --filename argocd-repo-certificate.yaml
kubectl apply --filename argocd-dex-certificate.yaml
cd ..

cd kustomize
bash ./kustomize-install-argocd.sh
cd ..
# bash ./install-argocd.sh

cd istio
kubectl apply --filename argocd-traffic-management-passthrough.yaml
# kubectl apply --filename argocd-traffic-management-simple.yaml
cd ..

# cd ambassador
# kubectl apply --filename argocd-edge-stack.yaml
# cd ..

# kubectl apply --filename argocd-server-ingress.yaml
