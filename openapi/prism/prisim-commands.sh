######################################################################

### install

brew install prism-cli
npm install -g @stoplight/prism-cli

prism --version
prism --help

######################################################################

### mock

prism mock --help
prism mock openapi.json --port 8090
prism mock openapi.yaml --port 8090

######################################################################

npx prism mock -d petstore3.json
