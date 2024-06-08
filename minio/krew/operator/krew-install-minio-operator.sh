#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### krew
# kubectl minio init --namespace minio-operator
kubectl minio init --namespace minio-operator --console-tls

### yaml
# kubectl minio init --namespace minio-operator --output > minio-operator.yaml
# kubectl minio init --namespace minio-operator --console-tls --output > minio-operator.yaml
# kubectl apply --filename minio-operator.yaml

######################################################################

### delete

### krew
# kubectl minio delete --namespace minio-operator

### yaml
# kubectl delete --filename minio-operator.yaml
