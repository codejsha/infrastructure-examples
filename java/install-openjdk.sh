#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### rhel - dnf
sudo dnf install -y java-11-openjdk-devel
sudo dnf install -y java-1.8.0-openjdk-devel

### rhel - yum
# sudo yum install -y java-11-openjdk-devel
# sudo yum install -y java-1.8.0-openjdk-devel
# sudo yum install -y java-1.7.0-openjdk-devel

### ubuntu
# sudo apt-get install -y openjdk-11-jdk
# sudo apt-get install -y openjdk-8-jdk
# sudo apt-get install -y openjdk-7-jdk
