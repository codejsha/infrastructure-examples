######################################################################
### confluent kafka
######################################################################

### schema

curl --silent \
    --header "Accept:application/json" \
    --request GET \
    http://schema-registry1.example.com:8081/schemas/types \
    | jq
### [
###   "JSON",
###   "PROTOBUF",
###   "AVRO"
### ]

######################################################################

### subject

### get
curl -s -X GET -H "Accept:application/json" http://schema-registry1.example.com:8081/subjects | jq
curl --silent \
    --user schema-registry:schema-registry-secret \
    --request GET \
    --header "Accept:application/json" \
    --cacert /opt/confluent/ssl/ca.crt \
    --cert /opt/confluent/ssl/schema_registry.crt \
    --key /opt/confluent/ssl/schema_registry.key \
    https://schema-registry1.example.com:8081/subjects \
    | jq

### post
curl -s -X POST -H "Accept:application/json" -H "Content-Type:application/json" http://schema-registry1.example.com:8081/subjects/clickstream-value/versions | jq

### delete
curl -s -X DELETE -H "Accept:application/json" -H "Content-Type:application/json" http://localhost:8081/subjects/clickstream-value/versions | jq

### version
curl -s -X GET -H "Accept:application/json" http://schema-registry1.example.com:8081/subjects/sakila-value/versions | jq
curl -s -X GET -H "Accept:application/json" http://schema-registry1.example.com:8081/subjects/sakila-value/versions/1 | jq
curl -s -X GET -H "Accept:application/json" http://schema-registry1.example.com:8081/subjects/sakila-value/versions/1/schema | jq

######################################################################

### compatibility

curl -s -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d @schema.json http://schema-registry1.example.com:8081/compatibility/subjects/test/versions/latest

######################################################################

### mode

curl -s -X GET -H "Accept:application/json" http://schema-registry1.example.com:8081/mode | jq

######################################################################

### config

curl -s -X GET -H "Accept:application/json" http://schema-registry1.example.com:8081/config | jq
