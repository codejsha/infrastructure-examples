######################################################################

function docker_run_redis() {
    docker container run \
        --detach \
        --name redis-server \
        --publish 6379:6379 \
        redis:latest
}
docker_run_redis
