######################################################################

### lint

npx @redocly/cli lint openapi.yaml

npm install @redocly/cli -g
redocly lint openapi.yaml

docker run --rm -v $PWD:/spec redocly/cli lint openapi.yaml

######################################################################

### build-docs

redocly build-docs openapi.yaml

######################################################################

### bundle
redocly bundle --config ./redocly.yaml core@v1
redocly bundle openapi.json -o bundle.json
