#!/bin/bash
set -o errtrace
set -o errexit
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: func ${FUNCNAME[0]}: status ${?}"' ERR

NAMESPACE="tekton-pipelines"
kubectl create namespace ${NAMESPACE}
kubectl config set-context --current --namespace="${NAMESPACE}"

# kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml
TEKTON_DASHBOARD_VERSION="0.9.0"
kubectl apply --filename https://github.com/tektoncd/dashboard/releases/download/v${TEKTON_DASHBOARD_VERSION}/tekton-dashboard-release.yaml
