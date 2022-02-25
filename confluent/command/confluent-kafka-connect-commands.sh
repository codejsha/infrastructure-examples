######################################################################

### plugin

### list
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connector-plugins | jq .[].class
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connector-plugins | jq .[].class
curl --silent \
    --request GET \
    --header "Accept:application/json" \
    --user kafka-connect:kafka-connect-secret \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    https://kafka-connect1.example.com:8083/connector-plugins \
    | jq .[].class

### validate connector
jq .config filestream-source.json > filestream-source-temp.json
curl --include --request PUT --header "Accept:application/json" --header "Content-Type:application/json" --data @filestream-source-temp.json http://localhost:8083/connector-plugins/PostgresConnector/config/validate
curl --include --request PUT --header "Accept:application/json" --header "Content-Type:application/json" --data @filestream-source-temp.json http://kafka-connect1:8083/connector-plugins/PostgresConnector/config/validate

######################################################################

### connector

### list
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors | jq
curl --silent \
    --request GET \
    --header "Accept:application/json" \
    --user kafka-connect:kafka-connect-secret \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/kafka_connect.crt \
    --key /opt/confluent/ssl/kafka_connect.key \
    https://kafka-connect1.example.com:8083/connectors \
    | jq

### register
curl --include --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @filestream-source.json http://localhost:8083/connectors
curl --include --request POST --header "Accept:application/json" --header "Content-Type:application/json" --data @filestream-source.json http://kafka-connect1:8083/connectors

### describe
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/filestream-source | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source | jq

### config
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/filestream-source/config | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source/config | jq

### update
jq .config filestream-source.json > filestream-source-temp.json
curl --include --request PUT --header "Accept:application/json" --header "Content-Type:application/json" --data @filestream-source-temp.json http://localhost:8083/connectors/filestream-source/config
curl --include --request PUT --header "Accept:application/json" --header "Content-Type:application/json" --data @filestream-source-temp.json http://kafka-connect1:8083/connectors/filestream-source/config

### status
curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/filestream-source/status | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source/status | jq

### delete
curl --silent --request DELETE --header "Accept:application/json" http://localhost:8083/connectors/filestream-source
curl --silent --request DELETE --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source

######################################################################

### topic

curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/filestream-source/topics | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source/topics | jq

######################################################################

### task

curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/filestream-source/tasks | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source/tasks | jq

curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/filestream-source/tasks/0 | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source/tasks/0 | jq

curl --silent --request GET --header "Accept:application/json" http://localhost:8083/connectors/filestream-source/tasks/0/status | jq
curl --silent --request GET --header "Accept:application/json" http://kafka-connect1:8083/connectors/filestream-source/tasks/0/status | jq
