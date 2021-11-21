#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

cd istio
kubectl apply -f argocd-traffic-management.yaml
cd ..

cd account
bash ./account-configmap.yaml
bash ./rbac-configmap.yaml
cd ..

cd cluster
bash ./add-cluster.sh
cd ..

cd repository
bash ./add-repository.sh
cd ..
