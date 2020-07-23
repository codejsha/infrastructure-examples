#!/usr/bin/bash

source jc-env.sh
source jc-env-job.sh

JENKINS_JOB_NAME="${1:-${JENKINS_JOB_NAME}}"

${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
    delete-job ${JENKINS_JOB_NAME}
