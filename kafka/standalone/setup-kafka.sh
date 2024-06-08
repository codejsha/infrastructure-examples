#!/bin/bash

# KAFKA_HOME="/usr/local/kafka"
# PATH="${PATH}:${KAFKA_HOME}/bin"
# export PATH

sudo mkdir -p /data/{zookeeper,kafka}
sudo chown -R 1000:1000 /data

sudo mkdir -p /logs/{zookeeper,kafka,schema-registry,kafka-connect}
sudo chown -R 1000:1000 /logs

touch /data/zookeeper/myid
echo 1 > /data/zookeeper/myid
