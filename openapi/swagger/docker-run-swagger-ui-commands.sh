######################################################################

docker run -d -p 8080:8080 -e SWAGGER_JSON=/openapi.json -v $(pwd)/openapi.json:/openapi.json swaggerapi/swagger-ui
docker run -d -p 8080:8080 -e SWAGGER_JSON_URL="https://petstore3.swagger.io/api/v3/openapi.json" swaggerapi/swagger-ui

docker run -p 8080:80 -e SPEC_URL=/openapi.json -v $(pwd)/openapi.json:/openapi.json redocly/redoc
docker run -p 8080:80 -e SPEC_URL=https://api.example.com/openapi.json redocly/redoc

docker run -d -p 8080:8080 -e SWAGGER_JSON_URL="https://api.example.com/openapi.json" -e DISPLAY_OPERATION_ID="true" -e DEFAULT_MODEL_RENDERING="model" -e DEFAULT_MODEL_EXPAND_DEPTH="15" swaggerapi/swagger-ui
