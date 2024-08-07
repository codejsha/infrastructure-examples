#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function install_httpd() {
    local HTTPD_HOME="/usr/local/httpd"
    local INSTALL_FILE_DIR="/mnt/share/apache-http-server"
    local PARENT_BUILD_DIR="/svc/install"

    local INSTALL_FILE="httpd-2.4.46.tar.gz"
    local APR_FILE="apr-1.7.0.tar.gz"
    local APRUTIL_FILE="apr-util-1.6.1.tar.gz"

    local HTTPD_DIR_NAME="${INSTALL_FILE/\.tar\.gz/}"
    local APR_DIR_NAME="${APR_FILE/\.tar\.gz/}"
    local APRUTIL_DIR_NAME="${APRUTIL_FILE/\.tar\.gz/}"
    local BUILD_DIR="${PARENT_BUILD_DIR}/${HTTPD_DIR_NAME}"

    function check_install_home {
        if [ -d "${HTTPD_HOME}" ]; then
            echo "[ERROR] The HTTPD_HOME (${HTTPD_HOME}) already exists!"
            exit
        fi
    }

    function install_required_package {
        sudo yum install -y \
            gcc \
            pcre pcre-devel \
            expat expat-devel \
            openssl openssl-devel

        ### http2 required package
        sudo yum install -y libnghttp2
        ### http2 debug
        # sudo yum install -y nghttp2
    }

    function download_install_file {
        if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
            sudo curl -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} -LJO http://archive.apache.org/dist/httpd/${INSTALL_FILE}
        fi
        if [ ! -f "${INSTALL_FILE_DIR}/${APR_FILE}" ]; then
            sudo curl -o ${INSTALL_FILE_DIR}/${APR_FILE} -LJO http://archive.apache.org/dist/apr/${APR_FILE}
        fi
        if [ ! -f "${INSTALL_FILE_DIR}/${APRUTIL_FILE}" ]; then
            sudo curl -o ${INSTALL_FILE_DIR}/${APRUTIL_FILE} -LJO http://archive.apache.org/dist/apr/${APRUTIL_FILE}
        fi
    }

    function check_install_file {
        if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
            echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
            exit
        fi
        if [ ! -f "${INSTALL_FILE_DIR}/${APR_FILE}" ]; then
            echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${APR_FILE}) does not exist!"
            exit
        fi
        if [ ! -f "${INSTALL_FILE_DIR}/${APRUTIL_FILE}" ]; then
            echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${APRUTIL_FILE}) does not exist!"
            exit
        fi
    }

    function extract_install_file {
        tar -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE} -C ${PARENT_BUILD_DIR}
        tar -xzf ${INSTALL_FILE_DIR}/${APR_FILE} -C ${PARENT_BUILD_DIR}
        tar -xzf ${INSTALL_FILE_DIR}/${APRUTIL_FILE} -C ${PARENT_BUILD_DIR}
    }

    function include_apr_files {
        cd ${PARENT_BUILD_DIR}
        mv ${APR_DIR_NAME} ${HTTPD_DIR_NAME}/srclib/apr
        mv ${APRUTIL_DIR_NAME} ${HTTPD_DIR_NAME}/srclib/apr-util
    }

    function configure_and_install {
        ### configure
        cd ${BUILD_DIR}
        ./configure --prefix=${HTTPD_HOME} \
            --with-included-apr \
            --enable-mpms-shared=all \
            --enable-modules=all
        # ./configure --prefix=${HTTPD_HOME} \
        #     --with-included-apr \
        #     --enable-mpms-shared=all \
        #     --enable-modules=most

        ### compile
        make
        ### install
        sudo make install

        sudo chown -R $(id -un):$(id -gn) ${HTTPD_HOME}
    }

    check_install_home
    install_required_package
    download_install_file
    check_install_file
    extract_install_file
    include_apr_files
    configure_and_install
}

install_httpd
