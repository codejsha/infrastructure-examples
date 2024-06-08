#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### install from git repository
ansible-galaxy collection install --collections-path /root/ansible-galaxy git+https://github.com/confluentinc/cp-ansible.git
ansible-galaxy collection list --collections-path /root/ansible-galaxy

######################################################################

### download collection
# ansible-galaxy collection download git+https://github.com/confluentinc/cp-ansible.git
# cd collections

### build collection
# git clone --single-branch --branch 7.0.1-post https://github.com/confluentinc/cp-ansible.git
# cd cp-ansible
# ansible-galaxy collection build

### install from collection archive
# ansible-galaxy collection install --collections-path /root/ansible-galaxy confluent-platform-7.0.1.tar.gz --force
# ansible-galaxy collection list --collections-path /root/ansible-galaxy
