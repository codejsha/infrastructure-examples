#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace


kubectl apply --filename https://raw.githubusercontent.com/istio/istio/master/samples/sleep/sleep.yaml
