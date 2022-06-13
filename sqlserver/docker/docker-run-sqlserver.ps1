function New-DockerRunSQLServer2022 {
    $password = "$password"

    docker container run `
        --detach `
        --name sqlserver2022 `
        --publish 1433:1433 `
        --env ACCEPT_EULA="Y" `
        --env MSSQL_PID="Developer" `
        --env SA_PASSWORD="$password" `
        --env MSSQL_AGENT_ENABLED="True" `
        mcr.microsoft.com/mssql/server:2022-latest
}

function New-DockerRunSQLServer2019 {
    $password = "$password"

    docker container run `
        --detach `
        --name sqlserver2019 `
        --publish 1433:1433 `
        --env ACCEPT_EULA="Y" `
        --env MSSQL_PID="Developer" `
        --env SA_PASSWORD="$password" `
        --env MSSQL_AGENT_ENABLED="True" `
        mcr.microsoft.com/mssql/server:2019-latest
}

function New-DockerRunSQLServer2017 {
    $password = "$password"

    docker container run `
        --detach `
        --name sqlserver2017 `
        --publish 1433:1433 `
        --env ACCEPT_EULA="Y" `
        --env MSSQL_PID="Developer" `
        --env SA_PASSWORD="$password" `
        --env MSSQL_AGENT_ENABLED="True" `
        mcr.microsoft.com/mssql/server:2017-latest
}

######################################################################

New-DockerRunSQLServer2019
# New-DockerRunSQLServer2017
