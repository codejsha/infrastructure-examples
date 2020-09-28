#!/usr/bin/bash

sudo yum install -y epel-release sshpass

cat <<EOF | sudo tee -a /etc/hosts
10.10.10.10 kubeaccess
10.10.10.11 kubecontrolplane1
10.10.10.12 kubecontrolplane2
10.10.10.13 kubecontrolplane3
10.10.10.21 kubenode1
10.10.10.22 kubenode2
10.10.10.23 kubenode3
EOF
