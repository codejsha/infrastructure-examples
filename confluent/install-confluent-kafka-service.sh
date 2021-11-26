#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function install_confluent_kafka {
cat <<EOF | sudo tee /etc/yum.repos.d/confluent.repo
[Confluent.dist]
name=Confluent repository (dist)
baseurl=https://packages.confluent.io/rpm/7.0/\$releasever
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/7.0/archive.key
enabled=1

[Confluent]
name=Confluent repository
baseurl=https://packages.confluent.io/rpm/7.0
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/7.0/archive.key
enabled=1
EOF

    sudo yum install -y curl which
    sudo yum install -y confluent-platform
    sudo yum install -y confluent-security
}

######################################################################

install_confluent_kafka
