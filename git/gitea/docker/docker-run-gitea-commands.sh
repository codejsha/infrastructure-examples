######################################################################

function docker_run_gitea() {
    docker container run \
        --detach \
        --name gitea \
        --publish 3000:3000 \
        --publish 3222:22 \
        docker.gitea.com/gitea:1.23.8
}
docker_run_gitea
