######################################################################

### connect
connect -u administrator -p jeusadmin
connect --username administrator --password jeusadmin

######################################################################

### server

### list
${JEUS_HOME}/bin/jeusadmin -u administrator -p jeusadmin "list-servers"

######################################################################

### docker

docker container run -it registry.connect.redhat.com/tmax/jeus7-0-0-5-das-openshift:latest bash
docker container run -it registry.connect.redhat.com/tmax/jeus8-0-0-0-das-openshift:latest bash
