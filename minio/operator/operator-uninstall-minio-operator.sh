#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### krew
kubectl minio delete
# kubectl minio delete --namespace minio-operator

### yaml
# kubectl delete --filename minio-operator.yaml
