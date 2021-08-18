#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### profile list
istioctl profile list
### Istio configuration profiles:
###     default
###     demo
###     empty
###     external
###     minimal
###     openshift
###     preview
###     remote

### install
istioctl install -y --set profile=default
# istioctl install -y --set profile=default \
#    --set meshConfig.accessLogFile=/dev/stdout

### verify
istioctl manifest generate --set profile=default | istioctl verify-install -f -
