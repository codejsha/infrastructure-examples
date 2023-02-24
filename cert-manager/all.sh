#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl apply --filename cert-manager-namespace.yaml

cd helm
bash ./helm-install-cert-manager.sh
cd ..

cd issuer
kubectl apply --filename selfsigned-cluster-issuer.yaml
# kubectl apply --filename selfsigned-issuer.yaml
cd ..

# bash ./verify-cert-manager.sh
