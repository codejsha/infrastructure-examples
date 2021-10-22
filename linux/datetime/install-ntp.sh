#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### rhel - dnf
sudo dnf install -y ntp
sudo systemctl enable ntpd
sudo systemctl start ntpd

### rhel - yum
# sudo yum install -y ntp
# sudo systemctl enable ntpd
# sudo systemctl start ntpd

### ubuntu
# sudo apt-get install -y ntp
