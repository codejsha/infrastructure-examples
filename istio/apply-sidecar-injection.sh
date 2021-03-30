#!/bin/bash
set -o errtrace
set -o errexit
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR

NAMESPACE="${1}"

### automatic sidecar injection
kubectl label namespace ${NAMESPACE} istio-injection=enabled
kubectl get namespace -L istio-injection

### manual sidecar injection
# kubectl apply --filename <(istioctl kube-inject -f httpbin.yaml)

istioctl proxy-status
