######################################################################

### install

### install openapi generator cli
brew install openapi-generator

### install swagger codegen
brew install swagger-codegen

######################################################################

openapi-generator generate -i petstore.yaml -o petstore -g go-echo-server
openapi-generator generate -i openapi.yaml -o sample -g typescript-fetch

java -cp ${HOME}/tools/openapi/openapi-generator-cli.jar:${HOME}/tools/openapi/custom-openapi-generator-0.1.0.jar \
        org.openapitools.codegen.OpenAPIGenerator generate \
        -i petstore.yaml -o petstore -g kotlin-spring
java -cp ${HOME}/tools/openapi/openapi-generator-cli.jar:${HOME}/tools/openapi/custom-openapi-generator-0.1.0.jar \
        org.openapitools.codegen.OpenAPIGenerator generate \
        -c config.json

docker run --rm openapitools/openapi-generator-cli help
docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate \
    -i /local/petstore.yaml -o /local/out/python -g python
