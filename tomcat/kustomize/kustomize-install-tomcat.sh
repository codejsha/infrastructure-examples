#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# kustomize build ./base | kubectl apply -f -
# kustomize build ./overlays/development | kubectl apply -f -
# kustomize build ./overlays/production | kubectl apply -f -

kustomize build https://github.com/codejsha/infrastructure-examples/tree/main/tomcat/kustomize/base | kubectl apply -f -
# kustomize build https://github.com/codejsha/infrastructure-examples/tree/main/tomcat/kustomize/overlays/development | kubectl apply -f -
# kustomize build https://github.com/codejsha/infrastructure-examples/tree/main/tomcat/kustomize/overlays/production | kubectl apply -f -
