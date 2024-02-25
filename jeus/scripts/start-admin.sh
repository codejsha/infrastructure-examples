#!/bin/bash

JEUS_HOME="/usr/local/jeus"
DOMAIN_NAME="jeus_domain"
SERVER_NAME="adminServer"
USERNAME="administrator"
PASSWORD="jeusadmin"

nohup ${JEUS_HOME}/domains/${DOMAIN_NAME}/bin/startDomainAdminServer \
    -domain ${DOMAIN_NAME} -server ${SERVER_NAME} -u ${USERNAME} -p ${PASSWORD}
