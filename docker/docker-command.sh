#!/usr/bin/bash

### container 

### remove all containers
docker container rm $(docker container ls --all --quiet)
docker container rm $(docker container ls --all --quiet --filter status=exited)
docker rm $(docker container ls --all --quiet)
docker rm $(docker container ls --all --quiet --filter status=exited)

### remove unused containers
docker container prune --force

######################################################################

### image

### remove all images
docker image rm $(docker image ls --all --quiet)
docker rmi $(docker image ls --all --quiet)

### remove dangling images
docker image rm $(docker image ls --all --quiet --filter dangling=true)
docker rmi $(docker image ls --all --quiet --filter dangling=true)

### remove unused images
docker image prune --force

######################################################################

### network

### remove unused networks
docker network prune --force

######################################################################

### volume

### remove unused volumes
docker volume prune --force
