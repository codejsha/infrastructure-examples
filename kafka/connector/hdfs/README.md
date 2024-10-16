# HDFS Source/Sink Connector

## Configuration

### HDFS source configurations

```json
    "hdfs.url": "",
    "hadoop.home": "",
    "hadoop.conf.dir": "",
    "topics.dir": "",
```

### HDFS sink configurations

```json
    "hdfs.url": "",
    "hadoop.home": "",
    "hadoop.conf.dir": "",
    "topics.dir": "",
    "logs.dir": "",
```

for hive integration:

```json
    "hive.integration": "",
    "hive.home": "",
    "hive.conf.dir": "",
    "hive.metastore.uris": "",
    "hive.database": "",
```

## Management

```sh
### hdfs source
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="hdfs-source"
CONNECTOR_CONFIG_FILE="hdfs-source.json"

### hdfs sink
KAFKA_CONNECT_URL="http://localhost:8083"
CONNECTOR_NAME="hdfs-sink"
CONNECTOR_CONFIG_FILE="hdfs-sink.json"
```

create connector:

```sh
curl -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d @${CONNECTOR_CONFIG_FILE} ${KAFKA_CONNECT_URL}/connectors
```

update connector:

```sh
curl -X PUT -H "Content-Type: application/json" -d $(jq -c .config ${CONNECTOR_CONFIG_FILE}) ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}/config
```

delete connector:

```sh
curl -X DELETE -H "Accept:application/json" ${KAFKA_CONNECT_URL}/connectors/${CONNECTOR_NAME}
```
