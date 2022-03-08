#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

PASSWORD="${PASSWORD}"

######################################################################

function docker_run_oracledb19 {
    local ORACLE_DB_VOLUME_DIR="/mnt/volume/oracledb19"
    sudo mkdir -p ${ORACLE_DB_VOLUME_DIR}/recovery_area

    sudo chgrp 54321 ${ORACLE_DB_VOLUME_DIR}
    sudo chown 54321 ${ORACLE_DB_VOLUME_DIR}
    sudo chgrp 54321 ${ORACLE_DB_VOLUME_DIR}/recovery_area
    sudo chown 54321 ${ORACLE_DB_VOLUME_DIR}/recovery_area

    ### enterprise
    docker container run \
        --detach \
        --name oracledb19 \
        --publish 1521:1521 \
        --publish 5500:5500 \
        --env ORACLE_SID="ORCLCDB" \
        --env ORACLE_PDB="ORCLPDB1" \
        --env ORACLE_PWD="${PASSWORD}" \
        --env ORACLE_CHARACTERSET="AL32UTF8" \
        --env ORACLE_EDITION="enterprise" \
        --env ENABLE_ARCHIVELOG="true" \
        --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share" \
        oracle/database:19.3.0-ee

    ### standard
    # docker container run \
    #     --detach \
    #     --name oracledb19 \
    #     --publish 1521:1521 \
    #     --publish 5500:5500 \
    #     --env ORACLE_SID="ORCLCDB" \
    #     --env ORACLE_PDB="ORCLPDB1" \
    #     --env ORACLE_PWD="${PASSWORD}" \
    #     --env ORACLE_CHARACTERSET="AL32UTF8" \
    #     --env ORACLE_EDITION="standard" \
    #     --env ENABLE_ARCHIVELOG="true" \
    #     --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
    #     oracle/database:19.3.0-ee
}

function docker_run_oracledb18 {
    local ORACLE_DB_VOLUME_DIR="/mnt/volume/oracledb18"
    sudo mkdir -p ${ORACLE_DB_VOLUME_DIR}

    sudo chmod 777 ${ORACLE_DB_VOLUME_DIR}

    docker container run \
        --detach \
        --name oracledb18 \
        --publish 1521:1521 \
        --publish 5500:5500 \
        --env ORACLE_SID="ORCLCDB" \
        --env ORACLE_PDB="ORCLPDB1" \
        --env ORACLE_PWD="${PASSWORD}" \
        --env ORACLE_CHARACTERSET="AL32UTF8" \
        --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
        oracle/database:18.3.0-ee
}

function docker_run_oracledb12_r2 {
    local ORACLE_DB_VOLUME_DIR="/mnt/volume/oracledb12"
    sudo mkdir -p ${ORACLE_DB_VOLUME_DIR}

    sudo chmod 777 ${ORACLE_DB_VOLUME_DIR}

    docker container run \
        --detach \
        --name oracledb12 \
        --publish 1521:1521 \
        --publish 5500:5500 \
        --env ORACLE_SID="ORCLCDB" \
        --env ORACLE_PDB="ORCLPDB1" \
        --env ORACLE_PWD="${PASSWORD}" \
        --env ORACLE_CHARACTERSET="AL32UTF8" \
        --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
        oracle/database:12.2.0.1-ee
}

function docker_run_oracledb12_r2_official_volume {
    docker pull store/oracle/database-enterprise:12.2.0.1

    docker volume create oracledb12vol

    docker container run \
        --detach \
        --name oracledb12 \
        --publish 1521:1521 \
        --mount type="bind",src="oracledb12vol",dst="/ORCL" \
        store/oracle/database-enterprise:12.2.0.1
}

function docker_run_oracledb12_r2_official {
    docker pull store/oracle/database-enterprise:12.2.0.1

    sudo mkdir -p /mnt/volume/oracledb12
    sudo chmod 777 /mnt/volume/oracledb12

    docker container run \
        --detach \
        --name oracledb12 \
        --publish 1521:1521 \
        --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
        store/oracle/database-enterprise:12.2.0.1
}

function docker_run_oracledb12_r1 {
    local ORACLE_DB_VOLUME_DIR="/mnt/volume/oracledb12"
    sudo mkdir -p ${ORACLE_DB_VOLUME_DIR}

    sudo chmod 777 ${ORACLE_DB_VOLUME_DIR}

    docker container run \
        --detach \
        --name oracledb12 \
        --publish 1521:1521 \
        --publish 5500:5500 \
        --env ORACLE_SID="ORCLCDB" \
        --env ORACLE_PDB="ORCLPDB1" \
        --env ORACLE_PWD="${PASSWORD}" \
        --env ORACLE_CHARACTERSET="AL32UTF8" \
        --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
        oracle/database:12.1.0.2-ee
}

function docker_run_oracledb11 {
    local ORACLE_DB_VOLUME_DIR="/mnt/volume/oracledb11"
    sudo mkdir -p ${ORACLE_DB_VOLUME_DIR}

    sudo chmod 777 ${ORACLE_DB_VOLUME_DIR}

    docker container run \
        --detach \
        --name oracledb11 \
        --publish 1521:1521 \
        --publish 5500:8080 \
        --shm-size="1g" \
        --env ORACLE_PWD="${PASSWORD}" \
        --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
        oracle/database:11.2.0.2-xe
}

######################################################################

docker_run_oracledb19
# docker_run_oracledb18
# docker_run_oracledb12_r2
# docker_run_oracledb12_r2_official_volume
# docker_run_oracledb12_r2_official
# docker_run_oracledb12_r1
# docker_run_oracledb11
