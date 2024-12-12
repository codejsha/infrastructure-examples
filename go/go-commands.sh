######################################################################

go run main.go

######################################################################

### test

go clean -testcache

go test ./...
go test ./... -v -coverprofile=cover.out

go test ./tests/...
go test ./tests/... -v -coverprofile=cover.out
