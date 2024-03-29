#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

TEKTON_CLI_VERSION="0.20.0"

curl -LJO https://github.com/tektoncd/cli/releases/download/v${TEKTON_CLI_VERSION}/tkn_${TEKTON_CLI_VERSION}_Linux_x86_64.tar.gz
sudo tar -zxf tkn_${TEKTON_CLI_VERSION}_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn

# curl -LJO https://github.com/tektoncd/cli/releases/download/v${TEKTON_CLI_VERSION}/tektoncd-cli-${TEKTON_CLI_VERSION}_Linux-64bit.rpm
# sudo rpm -Uvh tektoncd-cli-${TEKTON_CLI_VERSION}_Linux-64bit.rpm
