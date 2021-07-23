#!/bin/bash

JEUS_HOME="/home/tmax/jeus7"
SERVER_NAME="server2"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "remove-server ${SERVER_NAME}"
