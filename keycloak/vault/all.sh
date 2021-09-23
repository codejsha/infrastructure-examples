#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### KUSTOMIZE (KEYCLOAK OPERATOR)
export NAMESPACE="keycloak-system"
bash ./create-vault-issuer.sh
cd kustomize
bash ./create-kubernetes-role.sh
bash ./create-pki-role.sh
kubectl apply --namespace ${NAMESPACE} --filename keycloak-client-certificate.yaml
cd ..

### OPERATOR (KEYCLOAK OPERATOR)
# export NAMESPACE="my-keycloak-operator"
# bash ./create-vault-issuer.sh
# cd operator
# bash ./create-kubernetes-role.sh
# bash ./create-pki-role.sh
# kubectl apply --namespace ${NAMESPACE} --filename keycloak-client-certificate.yaml
# cd ..

### HELM
# export NAMESPACE="keycloak-system"
# bash ./create-vault-issuer.sh
# cd helm
# bash ./create-kubernetes-role.sh
# bash ./create-pki-role.sh
# kubectl apply --namespace ${NAMESPACE} --filename keycloak-client-certificate.yaml
# cd ..
