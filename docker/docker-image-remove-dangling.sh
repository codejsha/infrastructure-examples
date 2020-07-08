#!/usr/bin/bash

docker rmi $(docker image ls --all --quiet --filter dangling=true)
