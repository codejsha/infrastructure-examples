#!/usr/bin/bash

docker rm $(docker container ls --all --quiet)
# docker rm $(docker container ls --all --quiet --filter status=exited)
