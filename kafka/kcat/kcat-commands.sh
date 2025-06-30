######################################################################

alias kcat="docker container run -it edenhill/kcat:1.7.1"
alias kcat="docker container run -it --network host edenhill/kcat:1.7.1"

### version
docker container run --rm -it --network host edenhill/kcat:1.7.1 -V

######################################################################

### install kcat

### dnf/yum
sudo dnf copr enable -y bvn13/kafkacat
sudo dnf update
sudo dnf install -y kafkacat

### apt
sudo apt-get install -y kafkacat

### homebrew
brew install kcat

######################################################################

### topic

kcat -b localhost:9092 -t pageviews -L
kcat -b kafka1:9092,kafka2:9092,kafka3:9092 -t pageviews -L

######################################################################

### producer

######################################################################

### consumer

### avro consumer

kcat -b localhost:9092 -t pageviews -s avro -r http://localhost:8081
kcat -b localhost:9092 -t pageviews -s avro -r http://localhost:8081 -c10
kcat -b kafka1:9092,kafka2:9092,kafka3:9092 -t pageviews -s avro -r http://schema-registry1:8081
kcat -b kafka1:9092,kafka2:9092,kafka3:9092 -t pageviews -s avro -r http://schema-registry1:8081 -c10

kcat -b localhost:9092 -s avro -r http://localhost:8081 -G my-group pageviews
kcat -b localhost:9092 -s avro -r http://localhost:8081 -G my-group pageviews users
kcat -b localhost:9092 -s avro -r http://localhost:8081 -G my-group pageviews users -c10

kcat -b kubernetes.docker.internal:30000 -s avro -r http://kubernetes.docker.internal:30004 -G my-group my-avro-topic
