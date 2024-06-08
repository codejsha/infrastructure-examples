#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl -n minio-operator get secret console-sa-secret -o jsonpath="{.data.token}" | base64 --decode; echo
