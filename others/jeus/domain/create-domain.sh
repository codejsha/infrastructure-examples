#!/bin/bash

JEUS_HOME="/usr/loca/jeus"
DOMAIN_NAME="jeus_domain"

${JEUS_HOME}/bin/jeusadmin \
    "create-domain -domain ${DOMAIN_NAME}"
# ${JEUS_HOME}/bin/jeusadmin \
#     "create-domain -domain ${DOMAIN_NAME} -das adminServer -node testmachine -baseaddress 0.0.0.0 -baseport 9736 -baseaddress 9941 -httpport 8808 -jvmconfig '-Xmx1024m -XX:MaxPermSize=128m' -user administrator -productionmode"
# ${JEUS_HOME}/bin/jeusadmin \
#     "create-domain -domain ${DOMAIN_NAME} -das adminServer -node testmachine -baseaddress 0.0.0.0 -baseport 9736 -baseaddress 9941 -httpport 8808 -jvmconfig '-Xmx1024m -XX:MaxPermSize=128m' -user administrator -pw -productionmode"
