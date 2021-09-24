#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

argocd repo add https://git.example.com/developer/my-app-cd.git --type git --username developer --password developer --insecure-skip-server-verification --insecure --server argocd.example.com
