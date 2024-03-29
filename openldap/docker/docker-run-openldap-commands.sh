######################################################################

function docker_run_openldap() {
    sudo mkdir -p /mnt/volume/openldap/database
    sudo mkdir -p /mnt/volume/openldap/config

    docker run \
        --detach \
        --name openldap \
        --hostname openldap \
        --publish 389:389 \
        --publish 636:636 \
        --env LDAP_ORGANISATION="My Company" \
        --env LDAP_DOMAIN="example.com" \
        --env LDAP_ADMIN_PASSWORD="admin" \
        --volume /mnt/volume/openldap/database:/var/lib/ldap \
        --volume /mnt/volume/openldap/config:/etc/ldap/slapd.d \
        osixia/openldap:latest
}
docker_run_openldap

# docker exec openldap ldapsearch -x -H ldap://localhost -b dc=example,dc=com -D "cn=admin,dc=example,dc=com" -w admin
