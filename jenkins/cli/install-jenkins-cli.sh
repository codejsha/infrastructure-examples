#!/usr/bin/bash
# https://www.jenkins.io/doc/book/managing/cli

source jc-env.sh

if [ ! -f ${JENKINS_FILE_DIR}/jenkins-cli.jar ]; then
    mkdir -p ${JENKINS_FILE_DIR}
    curl -o ${JENKINS_FILE_DIR}/jenkins-cli.jar -JLO ${JENKINS_URL}/jnlpJars/jenkins-cli.jar
fi
