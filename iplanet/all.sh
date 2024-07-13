#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

cd server
bash ./create-server.sh
bash ./create-links.sh server1
cd ..

cd virtual-server
bash ./create-virtual-server.sh
bash ./delete-virtual-server.sh server1
cd ..
