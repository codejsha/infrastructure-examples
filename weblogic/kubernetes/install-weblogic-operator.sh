#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

if [ ! -d "weblogic-kubernetes-operator" ]; then
    git clone --depth 1 --branch v3.3.2 https://github.com/oracle/weblogic-kubernetes-operator
fi

kubectl create namespace sample-weblogic-operator-ns
kubectl create serviceaccount -n sample-weblogic-operator-ns sample-weblogic-operator-sa

helm install sample-weblogic-operator \
    --namespace sample-weblogic-operator-ns \
    --set image=ghcr.io/oracle/weblogic-kubernetes-operator:3.3.2 \
    --set serviceAccount=sample-weblogic-operator-sa \
    --set "enableClusterRoleBinding=true" \
    --set "domainNamespaceSelectionStrategy=LabelSelector" \
    --set "domainNamespaceLabelSelector=weblogic-operator\=enabled" \
    weblogic-kubernetes-operator/kubernetes/charts/weblogic-operator
