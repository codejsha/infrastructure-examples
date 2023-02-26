#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### Non HA
kubectl apply --namespace argocd --filename https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
### HA
# kubectl apply --namespace argocd --filename https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml
