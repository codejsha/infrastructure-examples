#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

sudo yum install -y epel-release
sudo yum install -y sshpass

cat <<EOF | sudo tee -a /etc/hosts
192.168.137.10 kubeaccess
192.168.137.11 controlplane1
192.168.137.12 controlplane2
192.168.137.13 controlplane3
192.168.137.21 node1
192.168.137.22 node2
192.168.137.23 node3
EOF
