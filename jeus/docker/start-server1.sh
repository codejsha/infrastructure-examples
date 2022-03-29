#!/bin/bash

JEUS_HOME="/home/tmax/jeus7"
DOMAIN_NAME="jeus_domain"
ADMIN_SERVER_URL="jeus-admin:9736"
SERVER_NAME="server1"
USERNAME="administrator"
PASSWORD="jeusadmin"

nohup ${JEUS_HOME}/domains/${DOMAIN_NAME}/bin/startManagedServer \
    -domain ${DOMAIN_NAME} -dasurl ${ADMIN_SERVER_URL} -server ${SERVER_NAME} -u ${USERNAME} -p ${PASSWORD} &

tail -f /dev/null
