######################################################################

pnpm dlx @scalar/cli help

alias scalar="pnpm dlx @scalar/cli"

######################################################################

### validate
scalar document validate openapi.yaml
scalar document validate openapi.json

######################################################################

### format
scalar document format openapi.yaml -o openapi.formatted.yaml
scalar document format openapi.json -o openapi.formatted.json

######################################################################

### bundle
scalar document bundle openapi.yaml -o bundled.yaml --treeShake
scalar document bundle openapi.json -o bundled.json --treeShake

######################################################################

### split
scalar document split openapi.yaml -o ./output/
scalar document split openapi.json -o ./output/

######################################################################

### join
scalar document join api1.yaml api2.yaml -o merged.yaml
scalar document join api1.json api2.json -o merged.json

#######################################################################

### mock server
scalar document mock openapi.yaml --port 8080 --watch
scalar document mock openapi.json --port 8080 --watch

#######################################################################

### serve the document
scalar document serve openapi.yaml --port 3000 --watch
scalar document serve openapi.json --port 3000 --watch
