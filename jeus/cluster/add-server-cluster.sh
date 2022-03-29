#!/bin/bash

JEUS_HOME="/usr/local/jeus"
CLUSTER_NAME="serverCluster1"
SERVER_LIST="server1,server2"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "add-cluster ${CLUSTER_NAME} -servers ${SERVER_LIST}"
