######################################################################

localstack --version

localstack start -d
localstack logs -f

localstack status services

######################################################################

### s3

aws --endpoint-url=http://localhost:4566 s3 mb s3://kafka-sink-storage
aws --endpoint-url=http://localhost:4566 s3 ls --recursive kafka-sink-storage

aws --endpoint-url=http://localhost:4566 s3 cp s3://bucket1/targetdir s3://bucket2/targetdir --recursive
