#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export APPROLE_ID="$(cat ${HOME}/.minio/tenant1-kes-approle-id.txt)"
export APPROLE_SECRET_ID="$(cat ${HOME}/.minio/tenant1-kes-approle-secret-id.txt)"

envsubst < ./tenant1-kes-configuration.yaml > ./tenant1-kes-configuration-temp.yaml

kubectl apply --filename ./tenant1-kes-configuration-temp.yaml
