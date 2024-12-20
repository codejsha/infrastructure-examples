#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

mkdir -p ~/.aliases
curl -o ~/.aliases/.kubectl_aliases -LJO https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases

# [ -f ~/.aliases/.kubectl_aliases ] && source ~/.aliases/.kubectl_aliases

######################################################################

# mkdir -p ~/.bashrc.d
# curl -o ~/.bashrc.d/kubectl_aliases -LJO https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
