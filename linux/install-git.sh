#!/usr/bin/bash

GIT_VERSION="2.27.0"

sudo yum install -y dh-autoreconf curl-devel expat-devel gettext-devel openssl-devel perl-devel zlib-devel
sudo yum install -y asciidoc xmlto docbook2X
sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

curl -JLO https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz
tar -zxf git-${GIT_VERSION}.tar.gz
cd git-${GIT_VERSION}
make configure
./configure --prefix=/usr
make all doc info
sudo make install install-doc install-html install-info

### init config
### global
# git config --global user.name ""
# git config --global user.email ""
### repository
# git config user.name ""
# git config user.email ""
