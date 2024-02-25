#!/bin/bash

JEUS_HOME="/usr/local/jeus"
CLUSTER_NAME="serverCluster1"
APP_NAME="failovertest"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "deploy-application ${APP_NAME} -clusters ${CLUSTER_NAME}"
