######################################################################

### connect ksqldb

ksql
ksql http://localhost:8088

dce='docker-compose exec'
dce ksqldb-client ksql http://ksqldb:8088
dce ksqldb ksql http://ksqldb:8088

######################################################################

### info

curl -s -X POST http://localhost:8088/ksql -H "Accept: application/json" -d $'{"ksql": "LIST STREAMS;"}' | jq

http GET :8088/info Accept:application/json
http GET :8088/healthcheck Accept:application/json
http GET :8088/status Accept:application/json

http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW PROPERTIES;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW TOPICS;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW TOPICS;"}' | jq '.[0].topics[].name'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW TYPES;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW TYPES;"}' | jq '.[0].types | keys'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW STREAMS;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW STREAMS;"}' | jq '.[0].streams[].name'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW TABLES;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW TABLES;"}' | jq '.[0].tables[].name'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW QUERIES;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "SHOW QUERIES;"}' | jq '.[0].queries[].id'


######################################################################

### /query

http POST :8088/query Accept:application/vnd.ksql.v1+json < select.json
http POST :8088/query Accept:application/vnd.ksql.v1+json <<< '{"ksql": "SELECT * FROM pageviews EMIT CHANGES LIMIT 10;", "streamsProperties": {"ksql.streams.auto.offset.reset": "earliest"}}'
