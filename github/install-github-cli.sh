#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### rhel
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh

### ubuntu
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
# sudo apt-add-repository https://cli.github.com/packages
# sudo apt update
# sudo apt install -y gh
