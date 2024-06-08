######################################################################

function docker_run_debezium_postgresql14() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data
    # docker container run --rm -i debezium/postgres:14 cat /usr/share/postgresql/postgresql.conf.sample > debezium-postgresql.conf
    sudo /bin/cp -f debezium-postgresql.conf ${POSTGRESQL_VOLUME_DIR}/postgresql.conf

    docker container run \
        --detach \
        --name postgresql14 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/postgresql.conf",dst="/etc/postgresql/postgresql.conf" \
        debezium/postgres:14 \
        -c "config_file=/etc/postgresql/postgresql.conf"
}
docker_run_debezium_postgresql14

function docker_run_debezium_postgresql13() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data
    # docker container run --rm -i debezium/postgres:13 cat /usr/share/postgresql/postgresql.conf.sample > debezium-postgresql.conf
    sudo /bin/cp -f debezium-postgresql.conf ${POSTGRESQL_VOLUME_DIR}/postgresql.conf

    docker container run \
        --detach \
        --name postgresql13 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/postgresql.conf",dst="/etc/postgresql/postgresql.conf" \
        debezium/postgres:13 \
        -c "config_file=/etc/postgresql/postgresql.conf"
}
docker_run_debezium_postgresql13

function docker_run_debezium_postgresql12() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data
    # docker container run --rm -i debezium/postgres:12 cat /usr/share/postgresql/postgresql.conf.sample > debezium-postgresql.conf
    sudo /bin/cp -f debezium-postgresql.conf ${POSTGRESQL_VOLUME_DIR}/postgresql.conf

    docker container run \
        --detach \
        --name postgresql12 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/postgresql.conf",dst="/etc/postgresql/postgresql.conf" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        debezium/postgres:12 \
        -c "config_file=/etc/postgresql/postgresql.conf"
}
docker_run_debezium_postgresql12

function docker_run_debezium_postgresql11() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data
    # docker container run --rm -i debezium/postgres:11 cat /usr/share/postgresql/postgresql.conf.sample > debezium-postgresql.conf
    sudo /bin/cp -f debezium-postgresql.conf ${POSTGRESQL_VOLUME_DIR}/postgresql.conf

    docker container run \
        --detach \
        --name postgresql11 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/postgresql.conf",dst="/etc/postgresql/postgresql.conf" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        debezium/postgres:11 \
        -c "config_file=/etc/postgresql/postgresql.conf"
}
docker_run_debezium_postgresql11
