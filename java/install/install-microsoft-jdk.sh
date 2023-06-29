#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# https://learn.microsoft.com/en-us/java/openjdk/install

### ubuntu
# Valid values are only '18.04' and '20.04'
# For other versions of Ubuntu, please use the tar.gz package

ubuntu_release="$(lsb_release -rs)"
wget https://packages.microsoft.com/config/ubuntu/${ubuntu_release}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install msopenjdk-17
# sudo apt-get install msopenjdk-11

### centos
# sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
# sudo yum install msopenjdk-17
# sudo yum install msopenjdk-11

### change the default jdk
# sudo update-java-alternatives --set msopenjdk-17-amd64
# sudo update-java-alternatives --set msopenjdk-11-amd64
