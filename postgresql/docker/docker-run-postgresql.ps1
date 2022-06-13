function New-DockerRunPostgreSQL14 {
    $password="postgres"
    $PostgreSQLVolumeDir = "$env:USERPROFILE\volume\postgresql"
    # Remove-Item -Path $PostgreSQLVolumeDir -Recurse -Force
    New-Item -Path $PostgreSQLVolumeDir/data -ItemType Directory -Force

    docker container run `
    --detach `
    --name postgresql14 `
    --publish 5432:5432 `
        --env POSTGRES_DB="postgres" `
        --env POSTGRES_USER="postgres" `
        --env POSTGRES_PASSWORD="$password" `
        --env PGDATA="/var/lib/postgresql/data/pgdata" `
        --mount type="bind",src="$PostgreSQLVolumeDir/data",dst="/var/lib/postgresql/data" `
        postgres:14
}

function New-DockerRunPostgreSQL13 {
    $password="postgres"
    $PostgreSQLVolumeDir = "$env:USERPROFILE\volume\postgresql"
    # Remove-Item -Path $PostgreSQLVolumeDir -Recurse -Force
    New-Item -Path $PostgreSQLVolumeDir/data -ItemType Directory -Force

    docker container run `
    --detach `
    --name postgresql13 `
    --publish 5432:5432 `
        --env POSTGRES_DB="postgres" `
        --env POSTGRES_USER="postgres" `
        --env POSTGRES_PASSWORD="$password" `
        --env PGDATA="/var/lib/postgresql/data/pgdata" `
        --mount type="bind",src="$PostgreSQLVolumeDir/data",dst="/var/lib/postgresql/data" `
        postgres:13
}

function New-DockerRunPostgreSQL12 {
    $password="postgres"
    $PostgreSQLVolumeDir = "$env:USERPROFILE\volume\postgresql"
    # Remove-Item -Path $PostgreSQLVolumeDir -Recurse -Force
    New-Item -Path $PostgreSQLVolumeDir/data -ItemType Directory -Force

    docker container run `
    --detach `
    --name postgresql12 `
    --publish 5432:5432 `
    --env POSTGRES_DB="postgres" `
    --env POSTGRES_USER="postgres" `
    --env POSTGRES_PASSWORD="$password" `
    --env PGDATA="/var/lib/postgresql/data/pgdata" `
        --mount type="bind",src="$PostgreSQLVolumeDir/data",dst="/var/lib/postgresql/data" `
        postgres:12
}

function New-DockerRunPostgreSQL11 {
    $password="postgres"
    $PostgreSQLVolumeDir = "$env:USERPROFILE\volume\postgresql"
    # Remove-Item -Path $PostgreSQLVolumeDir -Recurse -Force
    New-Item -Path $PostgreSQLVolumeDir/data -ItemType Directory -Force

    docker container run `
        --detach `
        --name postgresql11 `
        --publish 5432:5432 `
        --env POSTGRES_DB="postgres" `
        --env POSTGRES_USER="postgres" `
        --env POSTGRES_PASSWORD="$password" `
        --env PGDATA="/var/lib/postgresql/data/pgdata" `
        --mount type="bind",src="$PostgreSQLVolumeDir/data",dst="/var/lib/postgresql/data" `
        postgres:11
}

######################################################################

New-DockerRunPostgreSQL14
# New-DockerRunPostgreSQL13
# New-DockerRunPostgreSQL12
# New-DockerRunPostgreSQL11
