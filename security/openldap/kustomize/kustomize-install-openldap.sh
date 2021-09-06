#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

BASE="./base"
mkdir -p ${BASE}

CONTENT="https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/examples/ldap"
curl -s -o "${BASE}/#1" "${CONTENT}/base/{deployment.yaml,kustomization.yaml,service.yaml,env.startup.txt}"

kustomize build ./overlays/development | kubectl apply --filename -
# kustomize build ./overlays/development | kubectl delete --filename -
