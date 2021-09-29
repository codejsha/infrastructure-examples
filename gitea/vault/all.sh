#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="gitea"

bash ./create-vault-issuer.sh
bash ./create-kubernetes-role.sh
bash ./create-pki-role.sh
kubectl apply --namespace ${NAMESPACE} --filename gitea-certificate.yaml
