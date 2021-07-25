#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="vault-system"

ROOT_TOKEN_LINE="$(grep -E "Initial Root Token: " ~/.vault/unseal_keys_and_root_token.txt)"
ROOT_TOKEN="$(echo ${ROOT_TOKEN_LINE} | perl -p -e "s/Initial Root Token: //")"
echo ${ROOT_TOKEN} > ~/.vault/root_token.txt
