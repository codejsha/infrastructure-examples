######################################################################

### install

### homebrew
brew install --cask postman

### chocolatey
choco install -y postman

######################################################################

### Converting Postman collections from v1 to v2

### Install the Postman Collection Transformer
npm install -g postman-collection-transformer

### Convert an individual Postman collection from v1 to v2
postman-collection-transformer convert \
    --overwrite --pretty \
    --input collection_v1.json --input-version 1.0.0 \
    --output collection_v2.json --output-version 2.0.0
