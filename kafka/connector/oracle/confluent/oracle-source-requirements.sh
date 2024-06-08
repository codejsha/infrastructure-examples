#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

PASSWORD="${PASSWORD}"
ORACLE_DB_CONTAINER_NAME="oracledb19"

git clone https://github.com/debezium/oracle-vagrant-box.git
cd oracle-vagrant-box

# sed -i "s/top_secret/${PASSWORD}/g" setup-xstream.sh
# cat setup-xstream.sh | docker exec -i ${ORACLE_DB_CONTAINER_NAME} bash

sed -i "s/top_secret/${PASSWORD}/g" setup-logminer.sh
cat setup-logminer.sh | docker exec -i ${ORACLE_DB_CONTAINER_NAME} bash
