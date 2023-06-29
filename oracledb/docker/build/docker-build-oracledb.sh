#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### clone repository
if [ ! -d "./docker-images" ]; then
    git clone https://github.com/oracle/docker-images.git
    # gh repo clone oracle/docker-images
fi

cd docker-images/OracleDatabase/SingleInstance/dockerfiles

######################################################################

function docker_image_build_oracledb19() {
    /bin/cp -f /mnt/share/oracle-database/19c/LINUX.X64_193000_db_home.zip 19.3.0
    bash ./buildContainerImage.sh -v 19.3.0 -e -i
    rm -f 19.3.0/*.zip
}

function docker_image_build_oracledb18() {
    /bin/cp -f /mnt/share/oracle-database/18c/LINUX.X64_180000_db_home.zip 18.3.0
    bash ./buildContainerImage.sh -v 18.3.0 -e -i
    rm -f 18.3.0/*.zip
}

function docker_image_build_oracledb12_r2() {
    /bin/cp -f /mnt/share/oracle-database/12cr2/linuxx64_12201_database.zip 12.2.0.1
    bash ./buildContainerImage.sh -v 12.2.0.1 -e -i
    rm -f 12.2.0.1/*.zip
}

function docker_image_build_oracledb12_r1() {
    /bin/cp -f /mnt/share/oracle-database/12cr1/linuxamd64_12102_database_1of2.zip 12.1.0.2
    /bin/cp -f /mnt/share/oracle-database/12cr1/linuxamd64_12102_database_2of2.zip 12.1.0.2
    bash ./buildContainerImage.sh -v 12.1.0.2 -e -i
    rm -f 12.1.0.2/*.zip
}

function docker_image_build_oracledb11() {
    /bin/cp -f /mnt/share/oracle-database/11gr2/oracle-xe-11.2.0-1.0.x86_64.rpm.zip 11.2.0.2
    bash ./buildContainerImage.sh -v 11.2.0.2 -x -i
    rm -f 11.2.0.2/*.zip
}

######################################################################

docker_image_build_oracledb19
# docker_image_build_oracledb18
# docker_image_build_oracledb12_r2
# docker_image_build_oracledb12_r1
# docker_image_build_oracledb11
