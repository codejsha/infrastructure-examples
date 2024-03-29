#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../env-base.sh
source ./env-credentials.sh

CREDENTIALS_DOMAIN="${CREDENTIALS_DOMAIN}"

######################################################################

if [ ! -f "credentials-domain.xml" ]; then
cat <<EOF > ./credentials-domain.xml
<com.cloudbees.plugins.credentials.domains.Domain plugin="credentials@2.3.12">
    <name>${CREDENTIALS_DOMAIN}</name>
    <specifications/>
</com.cloudbees.plugins.credentials.domains.Domain>
EOF
fi

######################################################################

function create_credentials_domain_with_xml() {
    ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar \
        --silent ${JENKINS_URL} \
        -webSocket \
        -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
        create-credentials-domain-with-xml "SystemCredentialsProvider::SystemContextResolver::jenkins" < credentials-domain.xml
    # ${JAVA_HOME}/bin/java -jar ${JENKINS_FILE_DIR}/jenkins-cli.jar \
    #     --silent ${JENKINS_URL} \
    #     -webSocket \
    #     -auth ${JENKINS_USER}:${JENKINS_API_TOKEN} \
    #     create-credentials-domain-with-xml "system::system::jenkins" < credentials-domain.xml
}

######################################################################

create_credentials_domain_with_xml
