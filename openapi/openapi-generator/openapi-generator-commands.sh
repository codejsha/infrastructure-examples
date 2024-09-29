######################################################################

openapi-generator generate -i petstore.yaml -o petstore -g go-echo-server

openapi-generator generate -i openapi.yaml -o sample -g typescript-fetch
