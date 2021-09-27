#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### from helm repo

# helm repo add confluentinc https://packages.confluent.io/helm
# helm repo update

NAMESPACE="confluent"

# helm install confluent-operator \
helm upgrade --install confluent-operator \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    confluentinc/confluent-for-kubernetes

######################################################################

### using download bundle

# NAMESPACE="confluent"

# curl -LJO https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.0.3.tar.gz

# # helm install confluent-operator \
# helm upgrade --install confluent-operator \
#     --create-namespace \
#     --namespace ${NAMESPACE} \
#     --values values.yaml \
#     confluentinc/confluent-for-kubernetes
