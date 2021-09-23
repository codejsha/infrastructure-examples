#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

BASE_DIR="./base"
mkdir -p ${BASE_DIR}

git clone https://github.com/keycloak/keycloak-operator
# gh repo clone keycloak/keycloak-operator

/bin/cp -rf keycloak-operator/deploy/* base

kustomize build ./overlays/development | kubectl apply --filename -
# kustomize build ./overlays/development | kubectl delete --filename -
