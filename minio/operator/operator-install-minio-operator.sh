#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### krew
kubectl minio init
# kubectl minio init --namespace minio-operator

### yaml
# kubectl minio init --output > minio-operator.yaml
# kubectl apply --filename minio-operator.yaml
