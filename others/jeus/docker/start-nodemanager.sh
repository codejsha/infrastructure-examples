#!/bin/bash

JEUS_HOME="/home/tmax/jeus7"

nohup ${JEUS_HOME}/bin/startNodeManager &

tail -f /dev/null
