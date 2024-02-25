#!/bin/bash

JEUS_HOME="/home/tmax/jeus7"
DOMAIN_NAME="jeus_domain"
SERVER_NAME="adminServer"
USERNAME="administrator"
PASSWORD="jeusadmin"

nohup ${JEUS_HOME}/domains/${DOMAIN_NAME}/bin/startDomainAdminServer \
    -domain ${DOMAIN_NAME} -server ${SERVER_NAME} -u ${USERNAME} -p ${PASSWORD} &

tail -f /dev/null
