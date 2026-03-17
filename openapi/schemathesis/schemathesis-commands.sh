######################################################################

brew install schemathesis

schemathesis --help
schemathesis --version

######################################################################

schemathesis run openapi.json --url http://localhost:8090 --report junit,har,ndjson
schemathesis run openapi.json --url http://localhost:8090 --report junit,har,ndjson
schemathesis run openapi.json --url http://localhost:8090 --report junit,har,ndjson --warnings off
