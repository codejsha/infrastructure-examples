# Debezium Tutorial

version: debezium 2.7

- [Debezium Tutorial](#debezium-tutorial)
  - [Tutorial](#tutorial)
    - [Starting the services](#starting-the-services)
    - [Deploying the MySQL connector](#deploying-the-mysql-connector)
    - [Viewing change events](#viewing-change-events)
    - [Cleaning up](#cleaning-up)
  - [References](#references)

## Tutorial

### Starting the services

```bash
# start zookeeper
docker run -it --rm --name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 quay.io/debezium/zookeeper:2.7

# start kafka
docker run -it --rm --name kafka -p 9092:9092 --link zookeeper:zookeeper quay.io/debezium/kafka:2.7

# start a mysql database
docker run -it --rm --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=debezium -e MYSQL_USER=mysqluser -e MYSQL_PASSWORD=mysqlpw quay.io/debezium/example-mysql:2.7

# start a mysql command line client
docker run -it --rm --name mysqlterm --link mysql mysql:8.2 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

# start kafka connect
docker run -it --rm --name connect -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=my_connect_configs -e OFFSET_STORAGE_TOPIC=my_connect_offsets -e STATUS_STORAGE_TOPIC=my_connect_statuses --link kafka:kafka --link mysql:mysql quay.io/debezium/connect:2.7
```

### Deploying the MySQL connector

```bash
# registering a connector to monitor
bash ./register-mysql-source.sh
```

### Viewing change events

```bash
# start the watch-topic utility to watch the topic
docker run -it --rm --name watcher --link zookeeper:zookeeper --link kafka:kafka quay.io/debezium/kafka:2.7 watch-topic -a -k dbserver1.inventory.customers
```

### Cleaning up

```bash
docker container stop mysqlterm watcher connect mysql kafka zookeeper
```

## References

- Debezium Tutorial page: <https://debezium.io/documentation/reference/stable/tutorial.html>
- Debezium Tutorial GitHub: <https://github.com/debezium/debezium-examples/tree/master/tutorial>
