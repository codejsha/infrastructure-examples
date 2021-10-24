######################################################################

# ${ORACLE_HOME}/oracle_common/bin

./orapki wallet create -wallet ./default -auto_login

### display wallet
./orapki wallet display -wallet ./default
./orapki wallet display -complete -wallet ./default

######################################################################

### self signed certificate
./orapki wallet create -wallet default -auto_login_only
./orapki wallet add -wallet default -dn "CN=test.example.com,ST=Seoul,C=KR" -keysize 2048 -self_signed -validity 1095 -auto_login_only
./orapki wallet add -wallet default -dn "CN=localhost,ST=Seoul,C=KR" -keysize 2048 -self_signed -validity 1095 -auto_login_only
./orapki wallet display -wallet default/
