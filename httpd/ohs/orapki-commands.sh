######################################################################

# ORACLE_HOME=/usr/local/ohs

######################################################################

### create wallet
${ORACLE_HOME}/oracle_common/bin/orapki wallet create -wallet ./default -auto_login
${ORACLE_HOME}/oracle_common/bin/orapki wallet create -wallet ./default -auto_login_only

### display wallet
${ORACLE_HOME}/oracle_common/bin/orapki wallet display -wallet ./default
${ORACLE_HOME}/oracle_common/bin/orapki wallet display -wallet ./default -complete

######################################################################

### create wallet and import pkcs#12
${ORACLE_HOME}/oracle_common/bin/orapki wallet create \
    -wallet ./default -pwd welcome1 -auto_login
${ORACLE_HOME}/oracle_common/bin/orapki wallet import_pkcs12 \
    -wallet ./default -pwd welcome1 -pkcs12file tls.p12 -pkcs12pwd welcome1

######################################################################

### import trusted certificate
${ORACLE_HOME}/oracle_common/bin/orapki wallet add \
    -wallet ./default -trusted_cert -cert trusted-cert.crt

### import user certificate
${ORACLE_HOME}/oracle_common/bin/orapki wallet add \
    -wallet ./default -user_cert -cert user-cert.crt

######################################################################

### export certificate from wallet
${ORACLE_HOME}/oracle_common/bin/orapki wallet display \
    -wallet ./default -complete
${ORACLE_HOME}/oracle_common/bin/orapki wallet export \
    -wallet ./default -dn "<certificate dn>" -cert tls.crt

### export csr from wallet
${ORACLE_HOME}/oracle_common/bin/orapki wallet display \
    -wallet ./default -complete
${ORACLE_HOME}/oracle_common/bin/orapki wallet export \
    -wallet ./default -dn "<certificate dn>" -request tls.csr

######################################################################

### self signed certificate
${ORACLE_HOME}/oracle_common/bin/orapki wallet \
    create -wallet ./default -auto_login_only
${ORACLE_HOME}/oracle_common/bin/orapki wallet \
    add -wallet ./default -dn "CN=localhost,ST=Seoul,C=KR" -keysize 2048 -self_signed -validity 1095 -auto_login_only
${ORACLE_HOME}/oracle_common/bin/orapki wallet \
    add -wallet ./default -dn "CN=test.example.com,ST=Seoul,C=KR" -keysize 2048 -self_signed -validity 1095 -auto_login_only
${ORACLE_HOME}/oracle_common/bin/orapki wallet \
    display -wallet ./default
