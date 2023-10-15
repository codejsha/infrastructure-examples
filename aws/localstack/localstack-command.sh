######################################################################

localstack --version

localstack start -d
localstack logs -f

localstack status services
