#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add hashicorp https://helm.releases.hashicorp.com
# helm repo update

NAMESPACE="vault"

### dev mode:        values-dev.yaml
### standalone mode: values-standalone.yaml
### ha mode:         values-ha.yaml
helm upgrade --install my-vault \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --values values-standalone.yaml \
    --version 0.23.0 \
    hashicorp/vault
