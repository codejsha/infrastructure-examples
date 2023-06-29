######################################################################

function docker_run_oracledb19() {
    local PASSWORD="${PASSWORD}"
    local ORACLE_DB_VOLUME_DIR="/mnt/volume/oracledb19"
    sudo mkdir -p ${ORACLE_DB_VOLUME_DIR}/recovery_area

    sudo chgrp 54321 ${ORACLE_DB_VOLUME_DIR}
    sudo chown 54321 ${ORACLE_DB_VOLUME_DIR}
    sudo chgrp 54321 ${ORACLE_DB_VOLUME_DIR}/recovery_area
    sudo chown 54321 ${ORACLE_DB_VOLUME_DIR}/recovery_area

    ### enterprise edition
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

    ### standard edition
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
    #     --mount type="bind",src="/mnt/share",dst="/mnt/share" \
    #     oracle/database:19.3.0-ee
}
docker_run_oracledb19

function docker_run_oracledb18() {
    local PASSWORD="${PASSWORD}"
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
        --mount type="bind",src="/mnt/share",dst="/mnt/share" \
        oracle/database:18.3.0-ee
}
docker_run_oracledb18

function docker_run_oracledb12_r2() {
    local PASSWORD="${PASSWORD}"
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
        --mount type="bind",src="/mnt/share",dst="/mnt/share" \
        oracle/database:12.2.0.1-ee
}
docker_run_oracledb12_r2

function docker_run_oracledb12_r2_official() {
    local PASSWORD="${PASSWORD}"

    docker pull store/oracle/database-enterprise:12.2.0.1
    docker volume create oracledb12vol

    docker container run \
        --detach \
        --name oracledb12 \
        --publish 1521:1521 \
        --mount type="bind",src="oracledb12vol",dst="/ORCL" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share" \
        store/oracle/database-enterprise:12.2.0.1
}
docker_run_oracledb12_r2_official

function docker_run_oracledb12_r2_official_bind() {
    local PASSWORD="${PASSWORD}"
    sudo mkdir -p /mnt/volume/oracledb12
    sudo chmod 777 /mnt/volume/oracledb12

    docker pull store/oracle/database-enterprise:12.2.0.1

    docker container run \
        --detach \
        --name oracledb12 \
        --publish 1521:1521 \
        --mount type="bind",src="${ORACLE_DB_VOLUME_DIR}",dst="/opt/oracle/oradata" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share" \
        store/oracle/database-enterprise:12.2.0.1
}
docker_run_oracledb12_r2_official_bind

function docker_run_oracledb12_r1() {
    local PASSWORD="${PASSWORD}"
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
        --mount type="bind",src="/mnt/share",dst="/mnt/share" \
        oracle/database:12.1.0.2-ee
}
docker_run_oracledb12_r1

function docker_run_oracledb11() {
    local PASSWORD="${PASSWORD}"
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
        --mount type="bind",src="/mnt/share",dst="/mnt/share" \
        oracle/database:11.2.0.2-xe
}
docker_run_oracledb11
