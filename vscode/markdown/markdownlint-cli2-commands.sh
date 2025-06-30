######################################################################

## install markdownlint-cli2

### homebrew
brew install markdownlint-cli2

######################################################################

markdownlint-cli2 --fix "**/*.md" "#node_modules"

docker run -v $PWD:/workdir davidanson/markdownlint-cli2:v0.10.0 "**/*.md" "#node_modules"
