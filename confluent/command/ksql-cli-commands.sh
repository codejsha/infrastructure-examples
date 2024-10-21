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

http POST :8088/ksql Accept:application/json <<< '{"ksql": "LIST PROPERTIES;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "LIST TOPICS;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "LIST STREAMS;"}'
http POST :8088/ksql Accept:application/json <<< '{"ksql": "LIST TABLES;"}'

######################################################################

### /query

http POST :8088/query Accept:application/vnd.ksql.v1+json <<< '{"ksql": "SELECT * FROM pageviews EMIT CHANGES LIMIT 10;", "streamsProperties": {"ksql.streams.auto.offset.reset": "earliest"}}'
