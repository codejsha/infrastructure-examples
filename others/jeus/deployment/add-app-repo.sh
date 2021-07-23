#!/bin/bash

JEUS_HOME="/usr/local/jeus"
APP_REPO_PATH="/svc/app"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "add-application-repository ${APP_REPO_PATH}"
