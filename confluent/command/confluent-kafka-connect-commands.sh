######################################################################

### plugin

### list
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connector-plugins | jq .[].class
curl --silent \
    --user kafka-connect:kafka-connect-secret \
    --request GET \
    --header "Accept:application/json" \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    https://kafka-connect1.example.com:8083/connector-plugins \
    | jq .[].class

### validate connector
jq .config postgresql-source.json > postgresql-source-temp.json
curl --silent --request PUT --header "Accept:application/json" --header "Content-Type:application/json" --data @postgresql-source-temp.json http://localhost:8083/connector-plugins/PostgresqlConnector/config/validate
curl --silent \
    --user kafka-connect:kafka-connect-secret \
    --request PUT \
    --header "Accept:application/json" \
    --header "Content-Type:application/json" \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    --data @postgresql-source-temp.json \
    https://kafka-connect1.example.com:8083/connector-plugins/PostgresqlConnector/config/validate \
    | jq .[].class

######################################################################

### connector

### list
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors | jq
curl --silent \
    --user kafka-connect:kafka-connect-secret \
    --request GET \
    --header "Accept:application/json" \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    https://kafka-connect1.example.com:8083/connectors \
    | jq

### register
curl --include --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @postgresql-source.json http://localhost:8083/connectors
curl --silent \
    --user kafka-connect:kafka-connect-secret \
    --request POST \
    --header "Accept:application/json" \
    --header "Content-Type:application/json" \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    --data @postgresql-source.json \
    https://kafka-connect1.example.com:8083/connectors \
    | jq

### describe
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source | jq

### config
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source/config | jq
curl --silent \
    --user kafka-connect:kafka-connect-secret \
    --request GET \
    --header "Accept:application/json" \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    https://kafka-connect1.example.com:8083/connectors/postgresql-source/config \
    | jq

### update
jq .config postgresql-source.json > postgresql-source-temp.json
curl --include --request PUT --header "Accept:application/json" --header "Content-Type:application/json" --data @postgresql-source-temp.json http://localhost:8083/connectors/postgresql-source/config

### status
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source/status | jq

### delete
curl --silent --request DELETE --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source
curl --silent \
    --user kafka-connect:kafka-connect-secret \
    --request DELETE \
    --header "Accept:application/json" \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    https://kafka-connect1.example.com:8083/connectors/postgresql-source \
    | jq

######################################################################

### topic

curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source/topics | jq

######################################################################

### task

curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source/tasks | jq
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source/tasks/0 | jq
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/postgresql-source/tasks/0/status | jq
