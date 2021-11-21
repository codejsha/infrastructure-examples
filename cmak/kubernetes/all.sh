#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./kube-run-cmak.sh

kubectl apply --filename cmak-service.yaml
kubectl apply --filename cmak-ingress.yaml
