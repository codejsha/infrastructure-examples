#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

ansible-galaxy collection install \
    --collections-path /root/ansible-infra-stack \
    git+https://github.com/confluentinc/cp-ansible.git
# ansible-galaxy collection list -p /root/ansible-infra-stack

cd /root/ansible-infra-stack

# ansible -i inventory/confluent-hosts-plaintext.yml all -m ping
# ansible-playbook -i inventory/confluent-hosts-plaintext.yml all confluent.platform.all

# ansible -i inventory/confluent-hosts-scram-plaintext.yml all -m ping
# ansible-playbook -i inventory/confluent-hosts-scram-plaintext.yml all confluent.platform.all

# ansible -i inventory/confluent-hosts-scram-rbac-ssl.yml all -m ping
# ansible-playbook -i inventory/confluent-hosts-scram-rbac-ssl.yml all confluent.platform.all

ansible -i inventory/confluent-hosts-kerberos-rbac-ssl.yml all -m ping
ansible-playbook -i inventory/confluent-hosts-kerberos-rbac-ssl.yml all confluent.platform.all

# ansible -i inventory/confluent-hosts-kerberos-rbac-mtls.yml all -m ping
# ansible-playbook -i inventory/confluent-hosts-kerberos-rbac-mtls.yml all confluent.platform.all

# ansible-playbook -i hosts.yml confluent.platform.all --tags=zookeeper
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_broker
# ansible-playbook -i hosts.yml confluent.platform.all --tags=schema_registry
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_connect
# ansible-playbook -i hosts.yml confluent.platform.all --tags=ksql
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_rest
# ansible-playbook -i hosts.yml confluent.platform.all --tags=control_center
