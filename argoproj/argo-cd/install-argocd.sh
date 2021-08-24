#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

ARGOCD_VERSION="v2.1.0"

kubectl create namespace argocd

### Non HA
# kubectl apply --namespace argocd --filename https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply --namespace argocd --filename https://raw.githubusercontent.com/argoproj/argo-cd/${ARGOCD_VERSION}/manifests/install.yaml

### HA
# kubectl apply --namespace argocd --filename https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml
# kubectl apply --namespace argocd --filename https://raw.githubusercontent.com/argoproj/argo-cd/${ARGOCD_VERSION}/manifests/ha/install.yaml
