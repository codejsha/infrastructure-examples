#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl minio init \
    --namespace minio-operator \
    --namespace-to-watch minio-tenant-1,minio-tenant-2 \
    --console-tls \
    --prometheus-name my-kube-prometheus-stack-prometheus \
    --prometheus-namespace monitoring \
    --output > ./base/operator-init-temp.yaml

kustomize build ./base/ | kubectl apply -f -
