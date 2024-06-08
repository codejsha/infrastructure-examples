#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### clean up resources
cd istio-*/
kubectl delete --filename samples/addons
# istioctl manifest generate | kubectl delete --ignore-not-found=true --filename -
istioctl manifest generate --set profile=default | kubectl delete --ignore-not-found=true --filename -

### delete namespace
kubectl delete namespace istio-system --grace-period=0 --force
