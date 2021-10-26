#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./init-vault-server.sh
bash ./get-root-token.sh
bash ./unseal-vault-server.sh

cd istio
kubectl apply -f vault-traffic-management.yaml
cd ..

cd pki
bash ./generate-root-ca.sh
bash ./generate-intermediate-ca.sh
cd ..

cd kubernetes
bash ./enable-kubernetes-auth-method.sh
cd ..
