#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

sudo yum install -y install epel-release
sudo yum install -y vnstat

vnstat --testkernel

sudo vnstat --create -i eth0
sudo systemctl restart vnstat
