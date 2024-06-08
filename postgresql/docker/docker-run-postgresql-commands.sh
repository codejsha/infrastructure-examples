######################################################################

function docker_run_postgresql14() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name postgresql14 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        postgres:14
}
docker_run_postgresql14

function docker_run_postgresql13() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name postgresql13 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        postgres:13
}
docker_run_postgresql13

function docker_run_postgresql12() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name postgresql12 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        postgres:12
}
docker_run_postgresql12

function docker_run_postgresql11() {
    local PASSWORD="postgres"
    local POSTGRESQL_VOLUME_DIR="/mnt/volume/postgresql"
    # sudo rm -rf ${POSTGRESQL_VOLUME_DIR}
    sudo mkdir -p ${POSTGRESQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name postgresql11 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="bind",src="${POSTGRESQL_VOLUME_DIR}/data",dst="/var/lib/postgresql/data" \
        postgres:11
}
docker_run_postgresql11
