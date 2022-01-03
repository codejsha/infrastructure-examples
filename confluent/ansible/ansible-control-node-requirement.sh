#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

### ansible
# python3 -m pip install --user ansible
sudo /usr/bin/python3 -m pip install ansible
