#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

sudo mkdir -p /mnt/docker/openldap/database
sudo mkdir -p /mnt/docker/openldap/config

docker run \
    --detach \
    --name openldap \
    --hostname openldap \
    --publish 389:389 \
    --publish 636:636 \
    --env LDAP_ORGANISATION="My Company" \
    --env LDAP_DOMAIN="example.com" \
    --env LDAP_ADMIN_PASSWORD="admin" \
    --volume /mnt/docker/openldap/database:/var/lib/ldap \
    --volume /mnt/docker/openldap/config:/etc/ldap/slapd.d \
    osixia/openldap:latest

# docker exec openldap ldapsearch -x -H ldap://localhost -b dc=example,dc=com -D "cn=admin,dc=example,dc=com" -w admin
