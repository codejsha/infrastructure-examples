#!/bin/bash

JEUS_HOME="/usr/local/jeus"
CLUSTER_NAME="serverCluster1"
DATASOURCE_NAME="dataSource1"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "add-data-sources-to-cluster -cluster ${CLUSTER_NAME} -ids ${DATASOURCE_NAME}"
