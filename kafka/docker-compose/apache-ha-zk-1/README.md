# apache-ha-zk-1

## command output examples

```sh
http :8083/connector-plugins | jq '.[].class'

"io.debezium.connector.jdbc.JdbcSinkConnector"
"io.debezium.connector.db2.Db2Connector"
"io.debezium.connector.db2as400.As400RpcConnector"
"io.debezium.connector.informix.InformixConnector"
"io.debezium.connector.mariadb.MariaDbConnector"
"io.debezium.connector.mongodb.MongoDbConnector"
"io.debezium.connector.mysql.MySqlConnector"
"io.debezium.connector.oracle.OracleConnector"
"io.debezium.connector.postgresql.PostgresConnector"
"io.debezium.connector.spanner.SpannerConnector"
"io.debezium.connector.sqlserver.SqlServerConnector"
"io.debezium.connector.vitess.VitessConnector"
"org.apache.kafka.connect.mirror.MirrorCheckpointConnector"
"org.apache.kafka.connect.mirror.MirrorHeartbeatConnector"
"org.apache.kafka.connect.mirror.MirrorSourceConnector"
```

```sh
http :8084/connector-plugins | jq '.[].class'

"io.confluent.connect.s3.S3SinkConnector"
"io.confluent.connect.storage.tools.SchemaSourceConnector"
"io.confluent.kafka.connect.datagen.DatagenConnector"
"org.apache.kafka.connect.mirror.MirrorCheckpointConnector"
"org.apache.kafka.connect.mirror.MirrorHeartbeatConnector"
"org.apache.kafka.connect.mirror.MirrorSourceConnector"
```

```sh
http :8084/connectors/datagen-pageviews/config | jq -S
http :8084/connectors/datagen-pageviews/config | jq --sort-keys
```
