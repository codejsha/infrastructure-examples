#!/usr/bin/bash

source jc-env.sh
source jc-env-job.sh

JENKINS_JOB_NAME="${1:-${JENKINS_JOB_NAME}}"

if [ ! -f job.xml ]; then
cat <<EOF > ./job.xml
<?xml version='1.1' encoding='UTF-8'?>
<flow-definition plugin="workflow-job@2.39">
    <keepDependencies>false</keepDependencies>
    <properties/>
    <triggers/>
    <disabled>false</disabled>
</flow-definition>
EOF
fi

${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
    create-job ${JENKINS_JOB_NAME} < job.xml

### get-job
# ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
#     get-job ${JENKINS_JOB_NAME}
