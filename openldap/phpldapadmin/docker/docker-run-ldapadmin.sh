#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

docker run \
    --detach \
    --name ldapadmin \
    --publish 6080:80 \
    --publish 6443:443 \
    --env PHPLDAPADMIN_HTTPS=false \
    --env PHPLDAPADMIN_LDAP_HOSTS=10.0.1.80 \
    --env PHPLDAPADMIN_TRUST_PROXY_SSL=true \
    osixia/phpldapadmin:latest
