#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function docker_run_mysql8 {
    local PASSWORD="${PASSWORD}"
    local MYSQL_DATA_VOLUME="mysql_data"
    local MYSQL_CONFIG_VOLUME="mysql_config"
    docker volume create ${MYSQL_DATA_VOLUME}
    docker volume create ${MYSQL_CONFIG_VOLUME}

    docker container run \
        --detach \
        --name mysql8 \
        --publish 3306:3306 \
        --publish 33060:33060 \
        --env MYSQL_ROOT_PASSWORD="${PASSWORD}" \
        --mount type="volume",src="${MYSQL_DATA_VOLUME}",dst="/var/lib/mysql" \
        --mount type="volume",src="${MYSQL_CONFIG_VOLUME}",dst="/etc/mysql/conf.d" \
        mysql:8
}

function docker_run_mysql8_bind {
    local PASSWORD="${PASSWORD}"
    local MYSQL_VOLUME_DIR="/mnt/volume/mysql"
    mkdir -p ${MYSQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name mysql8 \
        --publish 3306:3306 \
        --publish 33060:33060 \
        --env MYSQL_ROOT_PASSWORD="${PASSWORD}" \
        --mount type="bind",src="${MYSQL_VOLUME_DIR}/data",dst="/var/lib/mysql" \
        mysql:8

        # --mount type="bind",src="${MYSQL_VOLUME_DIR}/config-file.cnf",dst="/etc/mysql/conf.d/config-file.cnf" \
}

function docker_run_mysql5_bind {
    local PASSWORD="${PASSWORD}"
    local MYSQL_VOLUME_DIR="/mnt/volume/mysql"
    mkdir -p ${MYSQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name mysql5 \
        --publish 3306:3306 \
        --publish 33060:33060 \
        --env MYSQL_ROOT_PASSWORD="${PASSWORD}" \
        --mount type="bind",src="${MYSQL_VOLUME_DIR}/data",dst="/var/lib/mysql" \
        mysql:5

        # --mount type="bind",src="${MYSQL_VOLUME_DIR}/config-file.cnf",dst="/etc/mysql/conf.d/config-file.cnf" \
}

######################################################################

docker_run_mysql8
# docker_run_mysql8_bind
# docker_run_mysql5_bind
