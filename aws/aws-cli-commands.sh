######################################################################

alias aws="docker container run --rm -it -v ~/.aws:/root/.aws -v \$(pwd):/aws amazon/aws-cli"

######################################################################

docker container run --rm -it amazon/aws-cli --version
docker container run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli --version
docker container run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli --version

docker container run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli configure
aws configure
### AWS Access Key ID [None]:
### AWS Secret Access Key [None]:
### Default region name [None]:
### Default output format [None]:

######################################################################

### s3

aws s3 cp s3://bucket1/targetdir s3://bucket2/targetdir --recursive

######################################################################

### ecs

aws ecs list-clusters
aws ecs describe-clusters --clusters <cluster-arn-or-name>
aws ecs list-services --cluster <cluster-arn-or-name>
aws ecs describe-services --cluster <cluster-arn-or-name> --services <service-name>
aws ecs list-tasks --cluster <cluster-arn-or-name>
aws ecs describe-tasks --cluster <cluster-arn-or-name> --tasks <task-id>

######################################################################

### msk

aws kafka list-kafka-versions

aws kafka list-clusters | jq
aws kafka list-clusters | jq '.ClusterInfoList[]' | jq '{ClusterName, ClusterArn}'
aws kafka describe-cluster --cluster-arn <cluster-arn>
aws kafka list-configurations | jq
aws kafka describe-configuration --arn <configuration-arn>

######################################################################

### sqs

aws sqs list-queues | jq
aws sqs get-queue-attributes --queue-url ${QUEUE_URL} --attribute-names All | jq
