######################################################################

function docker_run_mongodb_volume() {
    PASSWORD="${PASSWORD}"
    MONGODB_INIT_DATABASE="test"
    docker volume create mongodb_data

    docker container run \
        --detach \
        --name mongodb \
        --publish 27017:27017 \
        --env MONGO_INITDB_ROOT_USERNAME="root" \
        --env MONGO_INITDB_ROOT_PASSWORD="${PASSWORD}" \
        --env MONGO_INITDB_DATABASE="${MONGODB_INIT_DATABASE}" \
        --env TZ="Asia/Seoul" \
        --mount type="volume",src="mongodb_data",dst="/var/lib/mysql" \
        mongo:latest
}
docker_run_mongodb_volume

######################################################################

function docker_run_mongodb_with_conf() {
    PASSWORD="${PASSWORD}"
    MONGODB_INIT_DATABASE="test"
    MONGODB_DATA_VOLUME="mongodb_data"
    MONGODB_CONFIG_VOLUME="mongodb_config"
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
