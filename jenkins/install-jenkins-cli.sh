#!/usr/bin/bash
# https://www.jenkins.io/doc/book/managing/cli

source jenkins-cli-env.sh

if [ ! -f ${JENKINS_FILE_DIR}/jenkins-cli.jar ]; then
    mkdir -p ${JENKINS_FILE_DIR}
    curl -o ${JENKINS_FILE_DIR}/jenkins-cli.jar -JLO ${JENKINS_URL}/jnlpJars/jenkins-cli.jar
fi

cat > ${JENKINS_FILE_DIR}/${JENKINS_JOB_XML} <<EOF
<?xml version='1.1' encoding='UTF-8'?>
<flow-definition plugin="workflow-job@2.39">
    <keepDependencies>false</keepDependencies>
    <properties/>
    <triggers/>
    <disabled>false</disabled>
</flow-definition>
EOF
