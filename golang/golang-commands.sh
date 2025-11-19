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

go get github.com/codejsha/shared-library-go@latest
go get github.com/codejsha/shared-library-go@main
go get github.com/codejsha/shared-library-go@develop
go get github.com/codejsha/shared-library-go@v0.1.0

go get -u github.com/iancoleman/strcase

######################################################################

### style
go install golang.org/x/tools/cmd/goimports@latest

goimports -w ./internal/application ./internal/domain ./internal/infrastructure
gofmt -w ./internal/application ./internal/domain ./internal/infrastructure

######################################################################

### wire
# go install github.com/google/wire/cmd/wire@latest
go install github.com/wireinject/wire/cmd/wire@latest

wire check ./internal/di
wire show ./internal/di
wire gen ./internal/di

######################################################################

### golang-migrate

### install
brew install golang-migrate

migrate create -ext sql -dir db/migrations -seq init_tables
