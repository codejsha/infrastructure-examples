######################################################################

function docker_run_gitea_latest() {
    docker container run \
        --detach \
        --name gitea \
        --publish 3000:3000 \
        --publish 3222:22 \
        docker.gitea.com/gitea:latest
}
docker_run_gitea_latest

function docker_run_gitea_1_25() {
    docker container run \
        --detach \
        --name gitea \
        --publish 3000:3000 \
        --publish 3222:22 \
        docker.gitea.com/gitea:1.25
}
docker_run_gitea_1_25
