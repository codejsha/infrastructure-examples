#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function install_neovim_yum() {
    sudo yum install -y epel-release
    sudo yum install -y neovim
    # sudo yum install -y python36-neovim
}

function install_neovim_apt() {
    sudo apt-get install -y neovim
    # sudo apt-get install -y python3-neovim
}

function install_neovim_appimage() {
    local NEOVIM_VERSION="0.4.4"

    sudo yum install -y fuse fuse-sshfs

    if [ ! -e "/usr/local/bin/nvim" ]; then
        sudo curl -o /usr/local/bin/nvim -LJO https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/nvim.appimage
        sudo chmod 755 /usr/local/bin/nvim
    fi
}

######################################################################

install_neovim_yum
# install_neovim_apt
# install_neovim_appimage

mkdir -p ${HOME}/.config/nvim

cat <<EOF > ${HOME}/.config/nvim/init.vim
syntax on
set termguicolors
set background=dark
EOF

### add alias
# alias vi="nvim"
# alias vim="nvim"
# alias vimdiff="nvim -d"
