#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# kubectl apply --filename https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml
kubectl apply --filename https://github.com/jetstack/cert-manager/releases/download/v1.4.0/cert-manager.yaml
