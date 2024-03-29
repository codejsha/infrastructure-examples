#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### DEPLOY

# bash ./deploy-app.sh --port-offset=0 --path=/svc/app/helloworld --name=helloworld.war --runtime-name=helloworld.war
# bash ./deploy-app.sh --port-offset=1 --path=/svc/app/helloworld --name=helloworld.war --runtime-name=helloworld.war
bash ./deploy-app.sh --port-offset=0 --path=/svc/app/failovertest --name=failovertest.war --runtime-name=failovertest.war
bash ./deploy-app.sh --port-offset=1 --path=/svc/app/failovertest --name=failovertest.war --runtime-name=failovertest.war

######################################################################

### UNDEPLOY

# bash ./undeploy-app.sh --port-offset=0 --name=helloworld.war
# bash ./undeploy-app.sh --port-offset=1 --name=helloworld.war
# bash ./undeploy-app.sh --port-offset=0 --name=failovertest.war
# bash ./undeploy-app.sh --port-offset=1 --name=failovertest.war

######################################################################

### REDEPLOY (UNDEPLOY + DEPLOY)

# bash ./redeploy-app.sh --port-offset=0 --path=/svc/app/helloworld --name=helloworld.war --runtime-name=helloworld.war
# bash ./redeploy-app.sh --port-offset=1 --path=/svc/app/helloworld --name=helloworld.war --runtime-name=helloworld.war
# bash ./redeploy-app.sh --port-offset=0 --path=/svc/app/failovertest --name=failovertest.war --runtime-name=failovertest.war
# bash ./redeploy-app.sh --port-offset=1 --path=/svc/app/failovertest --name=failovertest.war --runtime-name=failovertest.war

######################################################################

### DISABLE WELCOME CONTENT

# bash ./disable-welcome-content.sh --port-offset=0
# bash ./disable-welcome-content.sh --port-offset=1
