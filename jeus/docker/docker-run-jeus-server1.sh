#!/bin/bash

### jeus7
docker container run \
    --detach \
    --name jeus-server1 \
    --hostname jeus-server1 \
    --network jeus-network \
    --publish 9936:9936 \
    --publish 8088:8088 \
    --publish 9741:9741 \
    --mount type="bind",src="/mnt/volume/jeus/scripts",dst="/home/tmax/jeus7/domains/jeus_domain/scripts" \
    registry.connect.redhat.com/tmax/jeus7-0-0-5-das-openshift:latest \
    /home/tmax/jeus7/domains/jeus_domain/scripts/start-server1.sh

### jeus8
# docker container run \
#     --detach \
#     --name jeus-server1 \
#     --hostname jeus-server1 \
#     --network jeus-network \
#     --publish 9936:9936 \
#     --publish 8088:8088 \
#     --publish 9741:9741 \
#     --mount type="bind",src="/mnt/volume/jeus/scripts",dst="/home/tmax/jeus8/domains/jeus_domain/scripts" \
#     registry.connect.redhat.com/tmax/jeus8-0-0-0-das-openshift:latest \
#     /home/tmax/jeus8/domains/jeus_domain/scripts/start-server1.sh
