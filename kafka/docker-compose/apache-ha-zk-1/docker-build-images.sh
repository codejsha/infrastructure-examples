#!/bin/bash
# SPDX-License-Identifier: APACHE-2.0
# SPDX-FileCopyrightText: Copyright 2024 Jinseong Ha

trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

docker build -f Dockerfile.zookeeper -t harbor.example.com/library/bitnami/zookeeper:3.9 .
docker build -f Dockerfile.kafka -t harbor.example.com/library/bitnami/kafka:3.8 .
docker build -f Dockerfile.schema-registry -t harbor.example.com/library/confluentinc/cp-schema-registry:7.7.0 .

docker build -f Dockerfile.connect-debezium -t harbor.example.com/library/debezium/connect:2.7 .
docker build -f Dockerfile.connect-cp -t harbor.example.com/library/confluentinc/cp-kafka-connect-custom:7.7.0 .

docker build -f prometheus/Dockerfile.prometheus -t harbor.example.com/library/prom/prometheus:v2.53.2 ./prometheus
docker build -f grafana/Dockerfile.grafana -t harbor.example.com/library/grafana/grafana:11.1.4 ./grafana

docker build -f kafka-lag-exporter/Dockerfile.lag-exporter -t harbor.example.com/library/lightbend/kafka-lag-exporter:0.6.8 ./kafka-lag-exporter
docker build -f burrow/Dockerfile.burrow -t harbor.example.com/library/linkedin/burrow:1.8.0 ./burrow

# docker impage push harbor.example.com/library/bitnami/zookeeper:3.9
# docker impage push harbor.example.com/library/bitnami/kafka:3.8
# docker impage push harbor.example.com/library/confluentinc/cp-schema-registry:7.7.0
# docker impage push harbor.example.com/library/debezium/connect:2.7
# docker impage push harbor.example.com/library/confluentinc/cp-kafka-connect-custom:7.7.0
# docker impage push harbor.example.com/library/prom/prometheus:v2.53.2
# docker impage push harbor.example.com/library/grafana/grafana:11.1.4
# docker impage push harbor.example.com/library/lightbend/kafka-lag-exporter:0.6.8
# docker impage push harbor.example.com/library/linkedin/burrow:1.8.0
