#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

istioctl version
### Istio is not present in the cluster: no running Istio pods in namespace "istio-system"
### client version: 1.23.2

### profile list
istioctl profile list
### Istio configuration profiles:
###     ambient
###     default
###     demo
###     empty
###     minimal
###     openshift
###     openshift-ambient
###     preview
###     remote
###     stable

### install
istioctl install -y --set profile=default
# istioctl install -y --set profile=default \
#    --set meshConfig.accessLogFile=/dev/stdout

### verify
istioctl manifest generate --set profile=default | istioctl verify-install -f -
