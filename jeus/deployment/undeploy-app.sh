#!/bin/bash

JEUS_HOME="/usr/local/jeus"
APP_NAME="failovertest"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "undeploy-application ${APP_NAME}"
