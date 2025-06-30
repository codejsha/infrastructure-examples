######################################################################

skopeo copy docker-daemon:harbor.example.com/bookstore/catalog:0.1.0 \
    docker://harbor.example.com/bookstore/catalog:0.1.0 \
    --dest-cert-dir . --debug
