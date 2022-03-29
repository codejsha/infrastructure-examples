#!/bin/bash

JEUS_HOME="/usr/local/jeus"
SERVER_NAME="server2"

${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
    "add-server ${SERVER_NAME} -node testmachine -addr 0.0.0.0 -port 9936 -jvm '-Xmx1024m -XX:MaxMetaspaceSize=128m' -logdir '/mnt/logs/jeus' -a Warning -m false -c true"

### duplicate the target server
# ${JEUS_HOME}/bin/jeusadmin -host localhost -port 9736 -u administrator -p jeusadmin \
#     "add-server ${SERVER_NAME} -target server1"
