#!/usr/bin/env bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
set -o xtrace

terraform init -upgrade
# terraform apply -auto-approve -target module.legacy
terraform apply -auto-approve -target module.proxy
terraform apply -auto-approve -target module.helm
terraform apply -auto-approve -target module.pool
