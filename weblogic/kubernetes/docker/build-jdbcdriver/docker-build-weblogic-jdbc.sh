#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

SHARE_DIR="/mnt/share"

mkdir -p lib

/bin/cp -rf ${SHARE_DIR}/oracle-mysql/connector/mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar lib
/bin/cp -rf ${SHARE_DIR}/tmax-tibero/tibero6-jdbc-driver/*.jar lib

docker image build --file Dockerfile --tag domain-home-in-image:14.1.1-jdbcdriver .
