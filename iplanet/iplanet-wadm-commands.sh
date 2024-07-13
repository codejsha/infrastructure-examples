######################################################################

create-config --port 8989 --platform 64 --host test.example.com --accept-cert=false --ssl=true --echo=true --http-port 80 --ip * --password-file /usr/local/iplanet/pswd-file --document-root /usr/local/iplanet/https-server1/docs --verbose=false --server-user webservd --prompt=false --jdk-home ${WS_INSTALL_ROOT}/jdk --rcfile null --user admin --server-name server1 server1
### CLI201 Command 'create-config' ran successfully

list-configs --port 8989 --host test.example.com --password-file /usr/local/iplanet/pswd-file --accept-cert=false --verbose=false --ssl=true --prompt=false --rcfile null --user admin --echo=true --all=false
### server1

create-instance --port 8989 --create-service=false --host test.example.com --accept-cert=false --ssl=true --echo=true --password-file /usr/local/iplanet/pswd-file --verbose=false --config server1 --force=false --prompt=false --rcfile null --user admin test.example.com
### CLI201 Command 'create-instance' ran successfully

######################################################################

pull-config --port 8989 --host test.example.com --password-file /usr/local/iplanet/pswd-file --accept-cert=false --verbose=false --config server1 --ssl=true --prompt=false --rcfile null --user admin --echo=true test.example.com
### CLI201 Command 'pull-config' ran successfully

deploy-config --port 8989 --restart=false --host test.example.com --accept-cert=false --ssl=true --reconfig=true --echo=true --password-file /usr/local/iplanet/pswd-file --verbose=false --prompt=false --force=false --rcfile null --user admin server1
### CLI201 Command 'deploy-config' ran successfully

######################################################################

create-virtual-server --port 8989 --host test.example.com --accept-cert=false --ssl=true --echo=true --host-pattern server1 --http-listener-name http-listener-1 --password-file /usr/local/iplanet/pswd-file --document-root /usr/local/iplanet/https-server1/docs --verbose=false --config server1 --prompt=false --rcfile null --user admin vserver1
### CLI201 Command 'create-virtual-server' ran successfully

create-http-listener --port 8989 --enabled=true --host test.example.com --listener-port 8080 --accept-cert=false --ssl=true --echo=true --ip * --default-virtual-server-name vserver1 --password-file /usr/local/iplanet/pswd-file --verbose=false --config server1 --prompt=false --rcfile null --user admin --server-name server1 http-listener-2
### CLI201 Command 'create-http-listener' ran successfully
