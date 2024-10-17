######################################################################

### connect ksqldb

ksql
ksql http://localhost:8088

dce='docker-compose exec'
dce ksqldb-client ksql http://ksqldb:8088
dce ksqldb ksql http://ksqldb:8088

######################################################################

curl -s -X POST http://localhost:8088/ksql -H "Accept: application/vnd.ksql.v1+json" -d $'{"ksql": "LIST STREAMS;"}' | jq

http POST :8088/ksql Accept:application/vnd.ksql.v1+json <<< '{"ksql": "LIST PROPERTIES;"}'
http POST :8088/ksql Accept:application/vnd.ksql.v1+json <<< '{"ksql": "LIST TOPICS;"}'
http POST :8088/ksql Accept:application/vnd.ksql.v1+json <<< '{"ksql": "LIST STREAMS;"}'
http POST :8088/ksql Accept:application/vnd.ksql.v1+json <<< '{"ksql": "LIST TABLES;"}'

######################################################################

### /query

http POST :8088/query Accept:application/vnd.ksql.v1+json <<< '{"ksql": "SELECT * FROM pageviews EMIT CHANGES LIMIT 10;", "streamsProperties": {"ksql.streams.auto.offset.reset": "earliest"}}'
