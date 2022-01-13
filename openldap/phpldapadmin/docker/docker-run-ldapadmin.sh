#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

docker run \
    --detach \
    --name ldapadmin \
    --hostname ldapadmin \
    --publish 6080:80 \
    --publish 6443:443 \
    --link openldap:ldap-host \
    --env PHPLDAPADMIN_HTTPS=false \
    --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host \
    --env PHPLDAPADMIN_TRUST_PROXY_SSL=true \
    osixia/phpldapadmin:latest
