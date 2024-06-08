path "kv/data/minio1*" {
   capabilities = [ "create", "read" ]
}
path "kv/metadata/minio1*" {
   capabilities = [ "list", "delete" ]
}
