#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### requirement:
### create-mds-key-commands.sh

bash ./create-kubernetes-role.sh
bash ./create-pki-role.sh
bash ./create-policy.sh

# bash ./create-all-component-certificate.sh
bash ./create-each-component-certificate.sh

bash ./create-java-key-store.sh
bash ./create-kv-secret.sh
bash ./add-kv-secret.sh
