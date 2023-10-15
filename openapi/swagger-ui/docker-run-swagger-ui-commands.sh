######################################################################

docker run -p 80:8080 -e SWAGGER_JSON=/openapi/swagger.json -v /foo/bar:/openapi swaggerapi/swagger-ui
docker run -p 80:8080 -e SWAGGER_JSON_URL=http://localhost:8080/api/v1/openapi.json swaggerapi/swagger-ui

