#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl patch secret --namespace minio-tenant minio-tenant-1-cert --patch-file patch-minio-secret.yaml
