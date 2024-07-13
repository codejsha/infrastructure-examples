######################################################################

function docker_run_mongodb() {
    local PASSWORD="${PASSWORD}"
    local MONGODB_INIT_DATABASE="test"
    local MONGODB_DATA_VOLUME="mongodb_data"
    docker volume create ${MONGODB_DATA_VOLUME}

    docker container run \
        --detach \
        --name mongodb \
        --publish 27017:27017 \
        --env MONGO_INITDB_ROOT_USERNAME="root" \
        --env MONGO_INITDB_ROOT_PASSWORD="${PASSWORD}" \
        --env MONGO_INITDB_DATABASE="${MONGODB_INIT_DATABASE}" \
        --env TZ="Asia/Seoul" \
        --mount type="volume",src="${MONGODB_DATA_VOLUME}",dst="/var/lib/mysql" \
        mongo:latest
}
docker_run_mongodb

######################################################################

function docker_run_mongodb_with_conf() {
    local PASSWORD="${PASSWORD}"
    local MONGODB_INIT_DATABASE="test"
    local MONGODB_DATA_VOLUME="mongodb_data"
    local MONGODB_CONFIG_VOLUME="mongodb_config"
    docker volume create ${MONGODB_DATA_VOLUME}
    docker volume create ${MONGODB_CONFIG_VOLUME}

    docker container run \
        --detach \
        --name mongodb \
        --publish 27017:27017 \
        --env MONGO_INITDB_ROOT_USERNAME="root" \
        --env MONGO_INITDB_ROOT_PASSWORD="${PASSWORD}" \
        --env MONGO_INITDB_DATABASE="${MONGODB_INIT_DATABASE}" \
        --env TZ="Asia/Seoul" \
        --mount type="volume",src="${MONGODB_DATA_VOLUME}",dst="/var/lib/mysql" \
        --mount type="volume",src="${MONGODB_CONFIG_VOLUME}",dst="/var/lib/mysql" \
        mongo:latest --config /etc/mongo/mongod.conf
}
docker_run_mongodb_with_conf
