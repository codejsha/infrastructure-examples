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

### golang-migrate

brew install golang-migrate

migrate create -ext sql -dir db/migrations -seq init_tables
