######################################################################

### list indices
curl -X GET "http://localhost:9200/_cat/indices?v"
curl -X GET "http://localhost:9200/_cat/indices/sample*?v"

######################################################################

### match all query
curl -s "http://localhost:9200/example_index/_search?pretty" \
  -H "Content-Type: application/json" \
  -d '{
    "query": { "match_all": {} }, "size": 10
  }'

######################################################################

### create index and bulk insert

curl -X DELETE "http://localhost:9200/sample_index"

### create index
curl -X PUT "http://localhost:9200/sample_index" \
  -H "Content-Type: application/json" \
  -d @sample-index.json

### bulk insert
curl -s -X POST "http://localhost:9200/_bulk?pretty" \
  -H "Content-Type: application/x-ndjson" \
  -d @sample-bulk.json
