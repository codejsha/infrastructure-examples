#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

### kubernetes
helm upgrade --install sample-weblogic-operator \
    --namespace sample-weblogic-operator-ns \
    --values values.yaml \
    weblogic-kubernetes-operator/kubernetes/charts/weblogic-operator

### openshift
# helm upgrade --install sample-weblogic-operator \
#     --namespace sample-weblogic-operator-ns \
#     --values values.yaml \
#     --values values-openshift.yaml \
#     weblogic-kubernetes-operator/kubernetes/charts/weblogic-operator
