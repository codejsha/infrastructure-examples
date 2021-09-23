#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### requirements:
### create-pki-role.sh
### create-kubernetes-role.sh

### namespace
kubectl create namespace minio-tenant

### certificate
cd vault
bash ./create-vault-issuer.sh
kubectl apply --filename tenant-certificate.yaml
kubectl apply --filename tenant-console-certificate.yaml
cd ..

### secret
kubectl apply --filename tenant-creds-secret.yaml
kubectl apply --filename tenant-console-secret.yaml

### tenant
# bash ./create-tenant.sh
kubectl apply --filename tenant.yaml

### ingress
# kubectl apply --filename tenant-console-ingress.yaml
# kubectl apply --filename tenant-ingress.yaml
