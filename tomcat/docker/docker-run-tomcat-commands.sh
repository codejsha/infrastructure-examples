######################################################################

function docker_run_tomcat9_bind() {
    docker container run \
        --detach \
        --name tomcat9 \
        --publish 8080:8080 \
        --mount type=bind,src=/mnt/share,dst=/mnt/share,readonly \
        tomcat:9-jdk11-temurin
}
docker_run_tomcat9_bind
