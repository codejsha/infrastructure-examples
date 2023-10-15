######################################################################

docker run -d --name zookeeper-container -e TZ=UTC -p 2181:2181 ubuntu/zookeeper:3.1-22.04_beta
docker run -d --name kafka-container -e TZ=UTC -p 9092:9092 -e ZOOKEEPER_HOST=host.docker.internal ubuntu/kafka:3.1-22.04_beta
