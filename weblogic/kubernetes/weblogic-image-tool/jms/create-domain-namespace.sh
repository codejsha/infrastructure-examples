#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

kubectl create namespace sample-domain2-ns
kubectl label ns sample-domain2-ns weblogic-operator=enabled
