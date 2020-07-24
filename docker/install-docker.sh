#!/usr/bin/bash

USERNAME="prouser"

sudo yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io

usermod -a -G docker ${USERNAME}
systemctl enable docker
systemctl start docker

# dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
# dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.10-3.2.el7.x86_64.rpm
# dnf install docker-ce -y
#
# usermod -a -G docker ${USERNAME}
# systemctl enable --now docker
# systemctl status docker
