#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add jenkins https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/chart
# helm repo update

NAMESPACE="jenkins-operator"

# helm install jenkins-operator \
helm upgrade --install jenkins-operator \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 0.8.0 \
    jenkins/jenkins-operator
