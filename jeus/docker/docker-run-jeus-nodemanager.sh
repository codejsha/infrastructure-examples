#!/bin/bash

### jeus7
docker container run \
    --detach \
    --name jeus-nodemgr \
    --hostname jeus-nodemgr \
    --network jeus-network \
    --publish 7730:7730 \
    --mount type="bind",src="/mnt/volume/jeus/scripts",dst="/home/tmax/jeus7/domains/jeus_domain/scripts" \
    registry.connect.redhat.com/tmax/jeus7-0-0-5-das-openshift:latest \
    /home/tmax/jeus7/domains/jeus_domain/scripts/start-nodemgr.sh

### jeus8
# docker container run \
#     --detach \
#     --name jeus-nodemgr \
#     --hostname jeus-nodemgr \
#     --network jeus-network \
#     --publish 7730:7730 \
#     --mount type="bind",src="/mnt/volume/jeus/scripts",dst="/home/tmax/jeus8/domains/jeus_domain/scripts" \
#     registry.connect.redhat.com/tmax/jeus8-0-0-0-das-openshift:latest \
#     /home/tmax/jeus8/domains/jeus_domain/scripts/start-nodemgr.sh
