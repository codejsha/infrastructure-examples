#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

ansible-galaxy collection install \
    git+https://github.com/confluentinc/cp-ansible.git

ansible -i hosts.yml all -m ping

# ansible-playbook -i hosts.yml confluent.platform.all
ansible-playbook -i hosts.yml confluent.platform.all -vvv

# ansible-playbook -i hosts.yml confluent.platform.all --tags=zookeeper -vvv
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_broker -vvv
# ansible-playbook -i hosts.yml confluent.platform.all --tags=schema_registry -vvv
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_rest -vvv
# ansible-playbook -i hosts.yml confluent.platform.all --tags=kafka_connect -vvv
# ansible-playbook -i hosts.yml confluent.platform.all --tags=ksql -vvv
# ansible-playbook -i hosts.yml confluent.platform.all --tags=control_center -vvv
