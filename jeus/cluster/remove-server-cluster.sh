#!/bin/bash

JEUS_HOME="/usr/local/jeus"
CLUSTER_NAME="serverCluster1"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "remove-cluster ${CLUSTER_NAME}"
