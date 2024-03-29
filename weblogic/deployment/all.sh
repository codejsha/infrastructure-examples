#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### DEPLOY APPLICATION
### bash ./deploy-app.sh ${APP_NAME} ${APP_PATH} ${APP_TARGET}

bash ./deploy-app.sh cachetest /svc/app/cachetest BaseCluster1
bash ./deploy-app.sh failovertest /svc/app/failovertest BaseCluster1
bash ./deploy-app.sh jdbcdrivertest /svc/app/jdbctest BaseCluster1
bash ./deploy-app.sh session-persistence-app /svc/app/session-persistence-app BaseCluster1
# bash ./deploy-app.sh weblogic-versioned /svc/app/weblogic-versioned/deployversion1/sample.war BaseCluster1
# bash ./deploy-app.sh sample1 /svc/app/sample1 ManagedServer1
# bash ./deploy-app.sh sample2 /svc/app/sample2 ManagedServer2
