#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

sudo curl -o /usr/local/bin/argocd -LJO https://github.com/argoproj/argo-cd/releases/download/v2.6.2/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
