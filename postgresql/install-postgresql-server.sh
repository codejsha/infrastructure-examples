#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

POSTGRESQL_VERSION="13"

######################################################################

function install_postgresql_server_dnf() {
    ### Install the repository RPM
    sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

    ### Disable the built-in PostgreSQL module
    sudo dnf -qy module disable postgresql

    ### Install PostgreSQL
    sudo dnf install -y postgresql${POSTGRESQL_VERSION}-server

    ### Optionally initialize the database and enable automatic start
    # sudo /usr/pgsql-${POSTGRESQL_VERSION}/bin/postgresql-${POSTGRESQL_VERSION}-setup initdb
    # sudo systemctl enable postgresql-${POSTGRESQL_VERSION}
    # sudo systemctl start postgresql-${POSTGRESQL_VERSION}
}

function install_postgresql_server_yum() {
    ### Install the repository RPM
    sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

    ### Install PostgreSQL
    sudo yum install -y postgresql${POSTGRESQL_VERSION}-server

    ### Optionally initialize the database and enable automatic start
    # sudo /usr/pgsql-${POSTGRESQL_VERSION}/bin/postgresql-${POSTGRESQL_VERSION}-setup initdb
    # sudo systemctl enable postgresql-${POSTGRESQL_VERSION}
    # sudo systemctl start postgresql-${POSTGRESQL_VERSION}
}

######################################################################

install_postgresql_server_dnf
# install_postgresql_server_yum
