######################################################################

### buf

### install
brew install buf

### list
buf ls-files

### generate
buf generate
buf generate --template buf.gen.payment.yaml

### lint
buf lint

### breaking
buf breaking --against-input '../.git#branch=main'
