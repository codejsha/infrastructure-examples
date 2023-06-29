######################################################################

function docker_openldap_admin() {
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
}
docker_openldap_admin
