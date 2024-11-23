######################################################################

go run main.go

######################################################################

go test ./...
go test ./... -v -coverprofile=cover.out

go test ./tests/...
go test ./tests/... -v -coverprofile=cover.out
