#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

USER_ID="1001"
USER_NAME="confluent"
GROUP_ID="1001"
GROUP_NAME="confluent"
HOME_DIRECTORY="/usr/local/confluent"
PASSWORD="confluent"

### add group
groupadd \
    --gid ${GROUP_ID} \
    ${GROUP_NAME}

### add user
useradd \
    --uid ${USER_ID} \
    --gid ${GROUP_ID} \
    --create-home \
    --home-dir ${HOME_DIRECTORY} \
    --password ${PASSWORD} \
    --shell /bin/bash \
    ${USER_NAME}

### sudoers
cat <<EOF | sudo tee /etc/sudoers.d/${USER_NAME}
${USER_NAME} ALL=(ALL) NOPASSWD:ALL
EOF
