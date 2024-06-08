#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# ansible -i hosts.yml all -m ping
# ansible-playbook -i hosts.yml confluent.platform.all --tags=zookeeper
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_broker
# ansible-playbook -i hosts.yml confluent.platform.all --tags=schema_registry
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_connect
# ansible-playbook -i hosts.yml confluent.platform.all --tags=ksql
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_rest
# ansible-playbook -i hosts.yml confluent.platform.all --tags=control_center

# ansible -i inventory/hosts-plaintext.yml all -m ping
# ansible-playbook -i inventory/hosts-plaintext.yml confluent.platform.all

# ansible -i inventory/hosts-scram-plaintext.yml all -m ping
# ansible-playbook -i inventory/hosts-scram-plaintext.yml confluent.platform.all

ansible -i inventory/hosts-scram-rbac-ssl.yml all -m ping
ansible-playbook -i inventory/hosts-scram-rbac-ssl.yml confluent.platform.all

# ansible -i inventory/hosts-kerberos-rbac-ssl.yml all -m ping
# ansible-playbook -i inventory/hosts-kerberos-rbac-ssl.yml confluent.platform.all
