######################################################################

### install

### homebrew
brew install go

### chocolatey
choco install -y golang

######################################################################

### test

go clean -testcache

go test ./...
go test ./... -v -coverprofile=cover.out

go test ./tests/...
go test ./tests/... -v -coverprofile=cover.out

######################################################################

go run main.go

######################################################################

### style

goimports -w ./internal/application/port/openapi
gofmt -w ./internal/application/port/openapi

######################################################################

### wire

wire check ./internal/di
wire show ./internal/di
wire gen ./internal/di

######################################################################

### golang-migrate

### install
brew install golang-migrate

migrate create -ext sql -dir db/migrations -seq init_tables
