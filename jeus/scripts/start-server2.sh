#!/bin/bash

JEUS_HOME="/usr/local/jeus"
DOMAIN_NAME="jeus_domain"
ADMIN_SERVER_URL="localhost:9736"
SERVER_NAME="server2"
USERNAME="administrator"
PASSWORD="jeusadmin"

nohup ${JEUS_HOME}/domains/${DOMAIN_NAME}/bin/startManagedServer \
    -domain ${DOMAIN_NAME} -dasurl ${ADMIN_SERVER_URL} -server ${SERVER_NAME} -u ${USERNAME} -p ${PASSWORD}
