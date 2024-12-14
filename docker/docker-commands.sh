######################################################################

docker container run --rm -it --name busybox busybox:latest
docker container run --rm -it --name dnstools infoblox/dnstools:latest

######################################################################

### process
sudo pgrep -xa dockerd | grep dockerd
sudo pgrep -xa docker-proxy | grep docker-proxy

######################################################################

### container

### remove all containers
docker container rm $(docker container ls --all --quiet)
### remove stopped containers
docker container prune --force
docker container rm $(docker container ls --all --quiet --filter status=exited)

### logs
docker container logs --follow
docker container logs --follow --tail
docker container ls
docker container ls --all

### start/stop/restart
docker container start
docker container stop
docker container restart

docker container run
docker container attach
docker container inspect

######################################################################

### image

docker image ls

### remove all images
docker image rm $(docker image ls --all --quiet)
### remove dangling images
docker image prune --force
docker image rm $(docker image ls --all --quiet --filter dangling=true)
### remove unused images
docker image prune --all --force

### save
docker save --output ${IMAGE_FILE} ${IMAGE}:${TAG}

### load
docker load --input ${IMAGE_FILE}

### image build
docker image build .
docker image build --tag example/tomcat:9 .
docker image build --file Dockerfile.dev --tag example/tomcat:9 .

######################################################################

### image tag and push

docker login registry.example.com
docker image tag centos:latest registry.example.com/centos:latest
docker image push registry.example.com/centos:latest

docker login harbor.example.com/library
docker image tag centos:latest harbor.example.com/library/centos:latest
docker image push harbor.example.com/library/centos:latest

######################################################################

### network

### create network
docker network create stream-network

### connect container to network
docker network connect stream-network kafka

### disconnect container from network
docker network disconnect stream-network kafka

### remove unused networks
docker network prune --force

docker network inspect

######################################################################

### volume

docker volume create
docker volume ls
docker volume rm

### remove unused volumes
docker volume prune --force

######################################################################

### registry

### repo list
curl --insecure --request GET --user ${USERNAME}:${PASSWORD} https://registry.example.com/v2/_catalog

### image list
curl --request GET --user ${USERNAME}:${PASSWORD} http://registry.example.com/v2/${IMAGE_NAME}/tags/list

### docker hub image tags
curl --silent "https://registry.hub.docker.com/v2/repositories/library/${IMAGE}/tags/" | jq '."results"[]["name"]' | tr -d '"';

### Search the Docker Hub for images
docker search
docker search --filter=is-official=true

######################################################################

### context

docker context create testmachine --docker "host=ssh://prouser@testmachine"

######################################################################

### connect to remote docker

### settings.json
"docker.host": "tcp://testmachine:2375"
"docker.explorerRefreshInterval": 3000

######################################################################

docker history

######################################################################

### for windows

# cd \\wsl$\docker-desktop-data
cd /mnt/wsl/docker-desktop-data

### unregister
wsl --unregister docker-desktop
wsl --unregister docker-desktop-data
