######################################################################

### install

### install openapi generator cli
brew install openapi-generator

### install swagger codegen
brew install swagger-codegen

######################################################################

openapi-generator generate -i petstore.yaml -o petstore -g go-echo-server

openapi-generator generate -i openapi.yaml -o sample -g typescript-fetch
