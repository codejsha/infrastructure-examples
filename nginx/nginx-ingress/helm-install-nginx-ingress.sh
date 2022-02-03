#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm repo update
#
# helm upgrade --install ingress-nginx \
#     --create-namespace \
#     --namespace ingress-nginx \
#     --version 4.0.16 \
#     ingress-nginx/ingress-nginx

helm upgrade --install ingress-nginx \
    --create-namespace \
    --namespace ingress-nginx \
    --repo https://kubernetes.github.io/ingress-nginx \
    ingress-nginx
