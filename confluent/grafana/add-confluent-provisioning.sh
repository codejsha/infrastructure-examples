#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

GRAFANA_HOME="/usr/local/grafana"

SHARE_DIR="/mnt/share"

/bin/cp -rf ${SHARE_DIR}/confluent-platform/grafana/{dashboards,datasources} ${GRAFANA_HOME}/conf/provisioning
