#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### rhel
# sudo yum install -y perl-IPC-Cmd perl-Data-Dumper

mkdir -p /svc/install
cd /svc/install

curl -JLO https://www.openssl.org/source/openssl-3.0.1.tar.gz
tar -xzf openssl-3.0.1.tar.gz

cd openssl-3.0.1
./Configure linux-x86_64 shared no-md2 no-mdc2 no-rc5 no-rc4 --prefix=/usr/local/ssl --openssldir=/usr/local/ssl
sudo make altinstall

# cd ..
# rm -f *.tgz
