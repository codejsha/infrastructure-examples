#!/bin/bash

PACKAGE_REPO_VOLUME_DIR="/mnt/volume/example-repo"
sudo mkdir -p ${PACKAGE_REPO_VOLUME_DIR}/package
cd ${PACKAGE_REPO_VOLUME_DIR}/package

# sudo repotrack ${PACKAGE}

sudo repotrack gcc
sudo repotrack make
sudo repotrack unzip

sudo createrepo --update ${PACKAGE_REPO_VOLUME_DIR}
sudo yum clean all
sudo yum repolist
