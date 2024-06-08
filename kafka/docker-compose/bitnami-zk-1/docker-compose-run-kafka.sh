#!/bin/bash
# SPDX-License-Identifier: APACHE-2.0
# SPDX-FileCopyrightText: Copyright 2020-2022 Jinseong Ha

# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

CLUSTER_VOLUME_DIR="/mnt/volume/kafka-cluster"
INSTALL_FILE_DIR="${USERPROFILE}/OneDrive/install-files"
INSTALL_SCRIPT_DIR="$(readlink -f .)"

docker-compose --file ${INSTALL_SCRIPT_DIR}/docker-compose.yaml down
sudo rm -rf ${CLUSTER_VOLUME_DIR}

### zookeeper
mkdir -p ${CLUSTER_VOLUME_DIR}/zookeeper/{zookeeper1,zookeeper2,zookeeper3}/{data,datalog,logs}

### kafka
mkdir -p ${CLUSTER_VOLUME_DIR}/kafka/{kafka1,kafka2,kafka3}/config
chmod -R 777 ${CLUSTER_VOLUME_DIR}/kafka/{kafka1,kafka2,kafka3}

### prometheus
mkdir -p ${CLUSTER_VOLUME_DIR}/prometheus
/bin/cp -f ${INSTALL_SCRIPT_DIR}/prometheus.yml alert.rules ${CLUSTER_VOLUME_DIR}/prometheus

### grafana
mkdir -p ${CLUSTER_VOLUME_DIR}/grafana/provisioning/{dashboards,datasources}
/bin/cp -f ${INSTALL_FILE_DIR}/confluent-platform/grafana/dashboards/* ${CLUSTER_VOLUME_DIR}/grafana/provisioning/dashboards
/bin/cp -f ${INSTALL_FILE_DIR}/confluent-platform/grafana/datasources/* ${CLUSTER_VOLUME_DIR}/grafana/provisioning/datasources

### jmx-exporter
mkdir -p ${CLUSTER_VOLUME_DIR}/jmx-exporter
/bin/cp -f ${INSTALL_FILE_DIR}/prometheus/jmx_prometheus_javaagent-0.17.0.jar ${CLUSTER_VOLUME_DIR}/jmx-exporter
/bin/cp -f ${INSTALL_FILE_DIR}/confluent-platform/jmx-exporter/*.yml ${CLUSTER_VOLUME_DIR}/jmx-exporter

### kafka-lag-exporter
mkdir -p ${CLUSTER_VOLUME_DIR}/kafka-lag-exporter
/bin/cp -f application.conf logback.xml ${CLUSTER_VOLUME_DIR}/kafka-lag-exporter

### network
KAFKA_DOCKER_NETWORK="stream-network"
docker network create ${KAFKA_DOCKER_NETWORK}

### docker compose
docker-compose --file ${INSTALL_SCRIPT_DIR}/docker-compose.yaml up --detach
