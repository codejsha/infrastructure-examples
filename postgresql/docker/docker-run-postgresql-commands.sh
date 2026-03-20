######################################################################

function docker_run_postgresql15() {
    PASSWORD="postgres"
    POSTGRESQL_DATA_VOLUME="postgresql15_data"
    docker volume create ${POSTGRESQL_DATA_VOLUME}

    docker container run \
        --detach \
        --name postgresql15 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="volume",source="${POSTGRESQL_DATA_VOLUME}",target="/var/lib/postgresql/data" \
        --mount type="bind",source="$(pwd)/sql",target="/docker-entrypoint-initdb.d" \
        postgres:15
}
docker_run_postgresql15

function docker_run_postgresql14() {
    PASSWORD="postgres"
    POSTGRESQL_DATA_VOLUME="postgresql14_data"
    docker volume create ${POSTGRESQL_DATA_VOLUME}

    docker container run \
        --detach \
        --name postgresql14 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="volume",source="${POSTGRESQL_DATA_VOLUME}",target="/var/lib/postgresql/data" \
        postgres:14
}
docker_run_postgresql14

function docker_run_postgresql13() {
    PASSWORD="postgres"
    POSTGRESQL_DATA_VOLUME="postgresql13_data"
    docker volume create ${POSTGRESQL_DATA_VOLUME}

    docker container run \
        --detach \
        --name postgresql13 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="volume",source="${POSTGRESQL_DATA_VOLUME}",target="/var/lib/postgresql/data" \
        postgres:13
}
docker_run_postgresql13

function docker_run_postgresql12() {
    PASSWORD="postgres"
    POSTGRESQL_DATA_VOLUME="postgresql12_data"
    docker volume create ${POSTGRESQL_DATA_VOLUME}

    docker container run \
        --detach \
        --name postgresql12 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="volume",source="${POSTGRESQL_DATA_VOLUME}",target="/var/lib/postgresql/data" \
        postgres:12
}
docker_run_postgresql12

function docker_run_postgresql11() {
    PASSWORD="postgres"
    POSTGRESQL_DATA_VOLUME="postgresql11_data"
    docker volume create ${POSTGRESQL_DATA_VOLUME}

    docker container run \
        --detach \
        --name postgresql11 \
        --publish 5432:5432 \
        --env POSTGRES_DB="postgres" \
        --env POSTGRES_USER="postgres" \
        --env POSTGRES_PASSWORD="${PASSWORD}" \
        --env PGDATA="/var/lib/postgresql/data/pgdata" \
        --mount type="volume",source="${POSTGRESQL_DATA_VOLUME}",target="/var/lib/postgresql/data" \
        postgres:11
}
docker_run_postgresql11
