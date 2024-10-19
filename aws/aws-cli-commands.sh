######################################################################

function aws() { echo "+ aws ${@}">&2; command aws "${@}"; }

alias aws="docker container run --rm -it -v ~/.aws:/root/.aws -v \$(pwd):/aws amazon/aws-cli"

######################################################################

docker container run --rm -it amazon/aws-cli --version
docker container run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli --version
docker container run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli --version

mkdir ~/.aws
docker container run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli configure
# aws configure
### AWS Access Key ID [None]:
### AWS Secret Access Key [None]:
### Default region name [None]:
### Default output format [None]:

######################################################################

### s3

aws s3 cp s3://bucket1/targetdir s3://bucket2/targetdir --recursive

######################################################################

### sqs

aws sqs list-queues | jq

aws sqs get-queue-attributes --queue-url ${QUEUE_URL} --attribute-names All | jq
