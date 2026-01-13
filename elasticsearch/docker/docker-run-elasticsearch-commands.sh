######################################################################

### single node container

docker run -e "discovery.type=single-node" \
  -e "xpack.security.enabled=false" \
  -p 9200:9200 \
  -p 9300:9300 \
  elasticsearch:9.2.3
