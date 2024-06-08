#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### lts (rhel)
curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -

######################################################################

### lts (ubuntu)
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# sudo apt-get install -y nodejs
