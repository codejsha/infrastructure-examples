#!/bin/bash

docker network create jeus-network

### jeus7
docker container run \
    --detach \
    --name jeus-admin \
    --hostname jeus-admin \
    --network jeus-network \
    --publish 9736:9736 \
    --publish 8808:8808 \
    --publish 9941:9941 \
    --mount type="bind",src="/mnt/volume/jeus/scripts",dst="/home/tmax/jeus7/domains/jeus_domain/scripts" \
    registry.connect.redhat.com/tmax/jeus7-0-0-5-das-openshift:latest \
    /home/tmax/jeus7/domains/jeus_domain/scripts/start-admin.sh

### jeus8
# docker container run \
#     --detach \
#     --name jeus-admin \
#     --hostname jeus-admin \
#     --network jeus-network \
#     --publish 9736:9736 \
#     --publish 8808:8808 \
#     --publish 9941:9941 \
#     --mount type="bind",src="/mnt/volume/jeus/scripts",dst="/home/tmax/jeus8/domains/jeus_domain/scripts" \
#     registry.connect.redhat.com/tmax/jeus8-0-0-0-das-openshift:latest \
#     /home/tmax/jeus8/domains/jeus_domain/scripts/start-admin.sh
