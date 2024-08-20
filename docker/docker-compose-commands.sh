######################################################################

alias docker-compose="docker compose"
function docker() { echo "+ docker ${@}">&2; command docker "${@}"; }

function docker-compose() { echo "+ docker-compose ${@}">&2; command docker-compose "${@}"; }

######################################################################

docker compose version

docker compose config

docker compose logs
docker compose logs --follow

######################################################################

### up/start

docker compose up
docker compose up --detach
docker compose up -d

docker compose start
docker-compose restart

######################################################################

### stop/down

docker compose stop

docker compose down
docker compose down --remove-orphans --volumes

######################################################################

### top

docker compose top
# apache-ha-zk-1-zookeeper1-1
# UID    PID     PPID    C    STIME   TTY   TIME       CMD
# 1001   40948   40860   0    18:26   ?     00:00:07   java -Dzookeeper.log.dir=...

# apache-ha-zk-1-zookeeper2-1
# UID    PID     PPID    C    STIME   TTY   TIME       CMD
# 1001   40896   40829   0    18:26   ?     00:00:08   java -Dzookeeper.log.dir=...

# apache-ha-zk-1-zookeeper3-1
# UID    PID     PPID    C    STIME   TTY   TIME       CMD
# 1001   40972   40898   0    18:26   ?     00:00:09   java -Dzookeeper.log.dir=...

######################################################################

### ps

docker compose ps
# NAME                          IMAGE                                              COMMAND                  SERVICE      CREATED          STATUS          PORTS
# apache-ha-zk-1-zookeeper1-1   harbor.example.com/library/bitnami/zookeeper:3.9   "/opt/bitnami/script…"   zookeeper1   31 minutes ago   Up 31 minutes   1234/tcp, 2181/tcp, 2888/tcp, 3888/tcp, 8080/tcp
# apache-ha-zk-1-zookeeper2-1   harbor.example.com/library/bitnami/zookeeper:3.9   "/opt/bitnami/script…"   zookeeper2   31 minutes ago   Up 31 minutes   1234/tcp, 2181/tcp, 2888/tcp, 3888/tcp, 8080/tcp
# apache-ha-zk-1-zookeeper3-1   harbor.example.com/library/bitnami/zookeeper:3.9   "/opt/bitnami/script…"   zookeeper3   31 minutes ago   Up 31 minutes   1234/tcp, 2181/tcp, 2888/tcp, 3888/tcp, 8080/tcp

docker compose ps --services
# zookeeper1
# zookeeper2
# zookeeper3

docker compose ps --filter "status=running"
docker compose ps --filter "status=dead"
docker compose ps --filter "status=exited"

######################################################################

### exec

docker compose exec httpd /bin/bash
docker compose exec --detach httpd /bin/bash -c "ls -al /var/www/html"
docker compose exec --detach httpd /bin/sh -c "ls -al /var/www/html"

######################################################################

docker compose kill
docker compose rm
