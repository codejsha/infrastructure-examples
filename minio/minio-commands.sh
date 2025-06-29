######################################################################

complete -C /usr/local/bin/mc mc

######################################################################

### install minio client (cli)

### binary/archive
curl -LJO https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
sudo mv mc /usr/local/bin
sudo chown root:root /usr/local/bin/mc

### homebrew
brew install minio-mc

######################################################################

### install minio server

### binary/archive
### default root id/pw: `minioadmin:minioadmin`
curl -LJO https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x minio
sudo chown root:root minio
sudo mv minio /usr/local/bin

######################################################################

### install kes

### binary/archive
curl -LJO https://github.com/minio/kes/releases/latest/download/kes-linux-amd64
chmod +x kes-linux-amd64
sudo mv kes-linux-amd64 /usr/local/bin/kes

### homebrew
brew install minio/stable/kes

######################################################################

### minio operator console jwt token
kubectl -n minio-operator get secret console-sa-secret -o jsonpath="{.data.token}" | base64 --decode; echo

######################################################################

### host config

MINIO_ALIAS="minio-tenant-1"
MINIO_URL="https://minio-tenant-1.example.com"

MINIO_ALIAS="my-minio"
MINIO_URL="http://minio.example.com"

MINIO_ALIAS="test-minio"
MINIO_URL="http://test.example.com:9001"

AWS_ACCESS_KEY="minio"
AWS_SECRET_KEY="minio123"

mc config host add ${MINIO_ALIAS} ${MINIO_URL} ${AWS_ACCESS_KEY} ${AWS_SECRET_KEY} --api s3v4
mc config host ls

######################################################################

### aws

aws configure
### AWS Access Key ID [None]:
### AWS Secret Access Key [None]:
### Default region name [None]:
### Default output format [None]:

aws configure set default.s3.signature_version s3v4

aws --endpoint-url ${MINIO_URL} s3 ls s3://mybucket
aws --endpoint-url ${MINIO_URL} s3 mb s3://mybucket
aws --endpoint-url ${MINIO_URL} s3 cp ${FILENAME} s3://mybucket
aws --endpoint-url ${MINIO_URL} s3 rm s3://mybucket/${FILENAME}
aws --endpoint-url ${MINIO_URL} s3 rb s3://mybucket

######################################################################

### list bucket
mc ls --insecure minio-tenant-1/
mc ls my-minio/

### make bucket
mc mb --insecure minio-tenant-1/default
mc mb --insecure minio-tenant-1/harbor-storage
mc mb --insecure minio-tenant-1/kafka-sink-storage
mc mb my-minio/default
mc mb my-minio/harbor-storage

### bucket policy
mc policy set download my-minio/kafka-connector
mc policy links my-minio/kafka-connector

######################################################################

mc cat

# copy object
mc cp
mc cp --preserve
mc cp --newer-than
mc cp --older-than
mc cp --recursive

mc du
mc find
mc ls
mc mb

# move object
mc mv
mc mv --preserve
mc mv --newer-than
mc mv --older-than
mc mv --recursive

# remove bucket
mc rb
mc rb --force

# remove object
mc rm
mc rm --newer-than
mc rm --older-than
mc rm --recursive
mc rm --recursive --force

# tree
mc tree
mc tree --depth
mc tree --files

######################################################################

kubectl minio proxy

### krew
kubectl minio tenant create \
    ${TENANT_NAME} \
    --namespace ${NAMESPACE} \
    --servers 1 \
    --volumes 4 \
    --capacity 4Ti \
    --storage-class ${STORAGE_CLASS}

### krew (dry run)
kubectl minio tenant create \
    ${TENANT_NAME} \
    --namespace ${NAMESPACE} \
    --servers 1 \
    --volumes 4 \
    --capacity 4Ti \
    --storage-class ${STORAGE_CLASS} \
    --output > tenant.yaml
