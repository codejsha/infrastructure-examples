######################################################################

oasdiff diff openapi-v0.yaml openapi-v1.yaml --strip-prefix-base /api --prefix-base /api/v1 --exclude-elements summary,description,endpoints --match-path notices/{id} -c
oasdiff diff openapi-v0.yaml openapi-v1.yaml --strip-prefix-base /api --prefix-base /api/v1 --exclude-elements summary,description,endpoints --match-path notices/{id} -c

oasdiff diff https://swagger.example.com/api/openapi.json https://swagger.example.com/api/openapi.json --strip-prefix-base /api --prefix-base /api/v1 --exclude-elements summary,description,endpoints,examples --composed --match-path notices

openapi-generator-cli generate -i https://swagger.example.com/api/openapi.json -g openapi -o ./output --skip-validate-spec
oasdiff diff output/openapi.json https://swagger.example.com/api/openapi.yaml --exclude-elements summary,description,endpoints,examples --strip-prefix-base /api --prefix-base /api/v1 --match-path notices | yq .paths
