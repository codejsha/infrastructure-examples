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

mc ls --insecure minio-tenant-1/
mc ls my-minio/

######################################################################

### make bucket

mc mb --insecure minio-tenant-1/default
mc mb --insecure minio-tenant-1/harbor-storage
mc mb --insecure minio-tenant-1/kafka-sink-storage

mc mb my-minio/default
mc mb my-minio/harbor-storage

######################################################################

### bucket policy

mc policy set download my-minio/kafka-connector
mc policy links my-minio/kafka-connector

######################################################################

kubectl minio proxy














# minio

function mc() { echo "+ mc ${@}">&2; command mc ${@}; }

alias mccat="mc cat"

# copy object
alias mccp="mc cp"
alias mccpa="mc cp --preserve"
alias mccpnewer="mc cp --newer-than"
alias mccpolder="mc cp --older-than"
alias mccpr="mc cp --recursive"

alias mcdu="mc du"
alias mcfind="mc find"
alias mcls="mc ls"
alias mcmb="mc mb"

# move object
alias mcmv="mc mv"
alias mcmva="mc mv --preserve"
alias mcmvnewer="mc mv --newer-than"
alias mcmvolder="mc mv --older-than"
alias mcmvr="mc mv --recursive"

# remove bucket
alias mcrb="mc rb"
alias mcrb=-force="mc rb --force"

# remove object
alias mcrm="mc rm"
alias mcrmnewer="mc rm --newer-than"
alias mcrmolder="mc rm --older-than"
alias mcrmr="mc rm --recursive"
alias mcrmr=-force="mc rm --recursive --force"

# tree
alias mctree="mc tree"
alias mctreed="mc tree --depth"
alias mctreef="mc tree --files"

complete -C /usr/local/bin/mc mc
