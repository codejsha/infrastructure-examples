#!/usr/bin/bash

source jc-env.sh

### username/password credential
CREDENTIAL_DOMAIN="cicd"
CREDENTIAL_USERNAME="username"
CREDENTIAL_PASSWORD="changeit"
CREDENTIAL_DESCRIPTION=""

### aws credential
# CREDENTIAL_DOMAIN="cicd"
# CREDENTIAL_ACCESSKEY="accesskey"
# CREDENTIAL_SECRETKEY="secretkey"
# CREDENTIAL_DESCRIPTION=""

CREDENTIAL_UUID=$(uuidgen)
echo "UUID: ${CREDENTIAL_UUID}"

function create_credential {
cat > credentials.xml <<EOF
<com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl plugin="credentials@2.3.12">
    <scope>GLOBAL</scope>
    <id>${CREDENTIAL_UUID}</id>
    <description>${CREDENTIAL_DESCRIPTION}</description>
    <username>${CREDENTIAL_USERNAME}</username>
    <password>${CREDENTIAL_PASSWORD}</password>
</com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>
EOF
}

function create_aws_credential {
cat > credentials-aws.xml <<EOF
<com.cloudbees.jenkins.plugins.awscredentials.AWSCredentialsImpl plugin="aws-credentials@1.28">
    <scope>GLOBAL</scope>
    <id>${CREDENTIAL_UUID}</id>
    <description>${CREDENTIAL_DESCRIPTION}</description>
    <accessKey>${CREDENTIAL_ACCESSKEY}</accessKey>
    <secretKey>${CREDENTIAL_SECRETKEY}</secretKey>
    <iamRoleArn></iamRoleArn>
    <iamMfaSerialNumber></iamMfaSerialNumber>
</com.cloudbees.jenkins.plugins.awscredentials.AWSCredentialsImpl>
EOF
}

create_credential
# create_aws_credential

### username/password credential
${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
    create-credentials-by-xml "SystemCredentialsProvider::SystemContextResolver::jenkins" "${CREDENTIAL_DOMAIN}" < credentials.xml
# ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
#     create-credentials-by-xml "system::system::jenkins" "${CREDENTIAL_DOMAIN}" < credentials.xml

### aws credential
# ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
#     create-credentials-by-xml "SystemCredentialsProvider::SystemContextResolver::jenkins" "${CREDENTIAL_DOMAIN}" < credentials-aws.xml
# ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
#     create-credentials-by-xml "system::system::jenkins" "${CREDENTIAL_DOMAIN}" < credentials-aws.xml

### get-credentials-as-xml
# ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
#     get-credentials-as-xml "SystemCredentialsProvider::SystemContextResolver::jenkins" "${CREDENTIAL_DOMAIN}" "${CREDENTIAL_UUID}"
# ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar -s ${JENKINS_URL} -webSocket -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
#     get-credentials-as-xml "system::system::jenkins" "${CREDENTIAL_DOMAIN}" "${CREDENTIAL_UUID}"
