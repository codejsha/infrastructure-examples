$password = "$password"

######################################################################

function New-DockerRunOracleDB19 {
    # $OracleDBVolumeDir="C:\volume\oracledb19"
    $OracleDBVolumeDir="$env:USERPROFILE\volume\oracledb19"
    New-Item -Path $OracleDBVolumeDir -ItemType Directory -Force

    docker container run `
        --detach `
        --name oracledb19 `
        --publish 1521:1521 `
        --publish 5500:5500 `
        --env ORACLE_SID="ORCLCDB" `
        --env ORACLE_PDB="ORCLPDB1" `
        --env ORACLE_PWD="$password" `
        --env ORACLE_CHARACTERSET="AL32UTF8" `
        --mount type="bind",src="$OracleDBVolumeDir",dst="/opt/oracle/oradata" `
        oracle/database:19.3.0-ee
}

function New-DockerRunOracleDB18 {
    # $OracleDBVolumeDir="C:\volume\oracledb18"
    $OracleDBVolumeDir="$env:USERPROFILE\volume\oracledb18"
    New-Item -Path $OracleDBVolumeDir -ItemType Directory -Force

    docker container run `
        --detach `
        --name oracledb18 `
        --publish 1521:1521 `
        --publish 5500:5500 `
        --env ORACLE_SID="ORCLCDB" `
        --env ORACLE_PDB="ORCLPDB1" `
        --env ORACLE_PWD="$password" `
        --env ORACLE_CHARACTERSET="AL32UTF8" `
        --mount type="bind",src="$OracleDBVolumeDir",dst="/opt/oracle/oradata" `
        oracle/database:18.3.0-ee
}

function New-DockerRunOracleDB12R2 {
    # $OracleDBVolumeDir="C:\volume\oracledb12"
    $OracleDBVolumeDir="$env:USERPROFILE\volume\oracledb12"
    New-Item -Path $OracleDBVolumeDir -ItemType Directory -Force

    docker container run `
        --detach `
        --name oracledb12 `
        --publish 1521:1521 `
        --publish 5500:5500 `
        --env ORACLE_SID="ORCLCDB" `
        --env ORACLE_PDB="ORCLPDB1" `
        --env ORACLE_PWD="$password" `
        --env ORACLE_CHARACTERSET="AL32UTF8" `
        --mount type="bind",src="$OracleDBVolumeDir",dst="/opt/oracle/oradata" `
        oracle/database:12.2.0.1-ee
}

function New-DockerRunOracleDB12R2OfficialVolume {
    docker pull store/oracle/database-enterprise:12.2.0.1

    docker volume create oracledb12vol

    docker container run `
        --detach `
        --name oracledb12 `
        --publish 1521:1521 `
        --mount type="bind",src="oracledb12vol",dst="/ORCL" `
        store/oracle/database-enterprise:12.2.0.1
}

function New-DockerRunOracleDB12R2Official {
    docker pull store/oracle/database-enterprise:12.2.0.1

    # $OracleDBVolumeDir="C:\volume\oracledb12"
    $OracleDBVolumeDir="$env:USERPROFILE\volume\oracledb12"
    New-Item -Path $OracleDBVolumeDir -ItemType Directory -Force

    docker container run `
        --detach `
        --name oracledb12 `
        --publish 1521:1521 `
        --mount type="bind",src="$OracleDBVolumeDir",dst="/ORCL" `
        store/oracle/database-enterprise:12.2.0.1
}

function New-DockerRunOracleDB12R1 {
    # $OracleDBVolumeDir="C:\volume\oracledb12"
    $OracleDBVolumeDir="$env:USERPROFILE\volume\oracledb12"
    New-Item -Path $OracleDBVolumeDir -ItemType Directory -Force

    docker container run `
        --detach `
        --name oracledb12 `
        --publish 1521:1521 `
        --publish 5500:5500 `
        --env ORACLE_SID="ORCLCDB" `
        --env ORACLE_PDB="ORCLPDB1" `
        --env ORACLE_PWD="$password" `
        --env ORACLE_CHARACTERSET="AL32UTF8" `
        --mount type="bind",src="$OracleDBVolumeDir",dst="/opt/oracle/oradata" `
        oracle/database:12.1.0.2-ee
}

function New-DockerRunOracleDB11 {
    # $OracleDBVolumeDir="C:\volume\oracledb11"
    $OracleDBVolumeDir="$env:USERPROFILE\volume\oracledb11"
    New-Item -Path $OracleDBVolumeDir -ItemType Directory -Force

    docker container run `
        --detach `
        --name oracledb11 `
        --publish 1521:1521 `
        --publish 5500:8080 `
        --shm-size="1g" `
        --env ORACLE_PWD="$password" `
        --mount type="bind",src="$OracleDBVolumeDir",dst="/u01/app/oracle/oradata" `
        oracle/database:11.2.0.2-xe
}

######################################################################

New-DockerRunOracleDB19
# New-DockerRunOracleDB18
# New-DockerRunOracleDB12R2
# New-DockerRunOracleDB12R2OfficialVolume
# New-DockerRunOracleDB12R2Official
# New-DockerRunOracleDB12R1
# New-DockerRunOracleDB11
