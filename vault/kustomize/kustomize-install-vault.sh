#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add hashicorp https://helm.releases.hashicorp.com
# helm repo update

NAMESPACE="vault"
chmod +x kustomize-build.sh

### dev mode:        values-dev.yaml
### standalone mode: values-standalone.yaml
### ha mode:         values-ha.yaml
helm upgrade --install vault \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values ../helm/values.yaml \
    --values ../helm/values-standalone.yaml \
    --post-renderer ./kustomize-build.sh \
    --version 0.23.0 \
    hashicorp/vault --dry-run
