######################################################################

### health check
curl -X GET http://localhost:8000/burrow/admin
# GOOD

### list clusters
curl -s -X GET http://localhost:8000/v3/kafka | jq .
# {
#   "error": false,
#   "message": "cluster list returned",
#   "clusters": [
#     "clusterlocal"
#   ],
#   "request": {
#     "url": "/v3/kafka",
#     "host": "burrow"
#   }
# }

######################################################################

### topic

### list cluster topics
curl -s -X GET http://localhost:8000/v3/kafka/clusterlocal/topic | jq '.topics |= sort'
# {
#   "error": false,
#   "message": "topic list returned",
#   "topics": [
#     "__consumer_offsets",
#     "_connect-configs",
#     "_connect-offsets",
#     "_connect-status",
#     "_schemas",
#     "my.topic",
#     "perf.test"
#   ],
#   "request": {
#     "url": "/v3/kafka/clusterlocal/topic",
#     "host": "burrow"
#   }
# }

### topic details
curl -s -X GET http://localhost:8000/v3/kafka/clusterlocal/topic/perf.test | jq .
# {
#   "error": false,
#   "message": "topic offsets returned",
#   "offsets": [
#     667855,
#     663920,
#     678225
#   ],
#   "request": {
#     "url": "/v3/kafka/clusterlocal/topic/perf.test",
#     "host": "burrow"
#   }
# }

######################################################################

### consumer

### list consumers
curl -s -X GET http://localhost:8000/v3/kafka/clusterlocal/consumer | jq .
# {
#   "error": false,
#   "message": "consumer list returned",
#   "consumers": [
#     "console-consumer-46196",
#     "burrow-clusterlocal"
#   ],
#   "request": {
#     "url": "/v3/kafka/clusterlocal/consumer",
#     "host": "burrow"
#   }
# }

## consumer group details
curl -s -X GET http://localhost:8000/v3/kafka/clusterlocal/consumer/burrow-clusterlocal | jq .

### consumer group status
curl -s -X GET http://localhost:8000/v3/kafka/clusterlocal/consumer/burrow-clusterlocal/status | jq .
# {
#   "error": false,
#   "message": "consumer status returned",
#   "status": {
#     "cluster": "clusterlocal",
#     "group": "burrow-clusterlocal",
#     "status": "OK",
#     "complete": 0,
#     "partitions": [],
#     "partition_count": 50,
#     "maxlag": {
#       "topic": "__consumer_offsets",
#       "partition": 0,
#       "owner": "",
#       "client_id": "",
#       "status": "OK",
#       "start": null,
#       "end": null,
#       "current_lag": 0,
#       "complete": 0
#     },
#     "totallag": 0
#   },
#   "request": {
#     "url": "/v3/kafka/clusterlocal/consumer/burrow-clusterlocal/status",
#     "host": "burrow"
#   }
# }

### consumer group lag
curl -s -X GET http://localhost:8000/v3/kafka/clusterlocal/consumer/burrow-clusterlocal/lag | jq .

### remove consumer group
curl -s -X DELETE http://localhost:8000/v3/kafka/clusterlocal/consumer/burrow-clusterlocal | jq .
