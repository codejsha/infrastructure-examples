#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function install_confluent_kafka {
cat <<EOF | sudo tee /etc/yum.repos.d/confluent.repo
[Confluent]
name=Confluent repository
baseurl=https://packages.confluent.io/rpm/7.2
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/7.2/archive.key
enabled=1

[Confluent-Clients]
name=Confluent Clients repository
baseurl=https://packages.confluent.io/clients/rpm/centos/\$releasever/\$basearch
gpgcheck=1
gpgkey=https://packages.confluent.io/clients/rpm/archive.key
enabled=1
EOF

    sudo yum install -y curl which
    sudo yum install -y confluent-platform
    sudo yum install -y confluent-security
}

######################################################################

install_confluent_kafka
