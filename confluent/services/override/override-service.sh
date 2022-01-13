#!/bin/bash

mkdir -p /etc/systemd/system/confluent-zookeeper.service.d
mkdir -p /etc/systemd/system/confluent-server.service.d
mkdir -p /etc/systemd/system/confluent-schema-registry.service.d
mkdir -p /etc/systemd/system/confluent-kafka-connect.service.d
mkdir -p /etc/systemd/system/confluent-ksqldb.service.d
mkdir -p /etc/systemd/system/confluent-control-center.service.d

/bin/cp -f override-zookeeper.conf /etc/systemd/system/confluent-zookeeper.service.d
/bin/cp -f override-kafka.conf /etc/systemd/system/confluent-server.service.d
/bin/cp -f override-schema-registry.conf /etc/systemd/system/confluent-schema-registry.service.d
/bin/cp -f override-kafka-connect.conf /etc/systemd/system/confluent-kafka-connect.service.d
/bin/cp -f override-ksqldb.conf /etc/systemd/system/confluent-ksqldb.service.d
/bin/cp -f override-control-center.conf /etc/systemd/system/confluent-control-center.service.d
