######################################################################

redis-cli
redis-cli -h 127.0.0.1 -p 6379

PING
### > PONG

INFO
MONITOR

SCAN 0
KEYS '*'

SELECT 1

EXISTS key
GET key
TTL key
