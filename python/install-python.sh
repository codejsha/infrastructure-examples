#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### rhel
# sudo yum install -y libffi-devel gcc-devel zlib-devel openssl-devel

mkdir -p /svc/install
cd /svc/install

curl -LJO https://www.python.org/ftp/python/3.10.1/Python-3.10.1.tgz
tar -xzf Python-3.10.1.tgz

cd Python-3.10.1
./configure --enable-optimizations
sudo make altinstall

# cd ..
# rm -f *.tgz
