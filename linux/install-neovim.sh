#!/usr/bin/bash

USERNAME="prouser"

sudo yum install -y fuse fuse-sshfs

if [ ! -e "/usr/local/bin/nvim" ]; then
    curl -o /usr/local/bin/nvim -JLO https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage
    chmod 755 /usr/local/bin/nvim
fi

HOME_DIRECTORY=""
if [ ${USERNAME} == "root" ]; then
    HOME_DIRECTORY="/root"
else
    HOME_DIRECTORY="/home/${USERNAME}"
fi

su - ${USERNAME} -c "mkdir -p ${HOME_DIRECTORY}/.config/nvim"
su - ${USERNAME} -c "cat > ${HOME_DIRECTORY}/.config/nvim/init.vim <<EOF
syntax on
set termguicolors
set background=dark

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<F11>
EOF"

GREP_VAR="$(grep -q nvim ${HOME_DIRECTORY}/.bashrc)"
if [ -n "${GREP_VAR}" ]; then
su - ${USERNAME} -c "cat >> ${HOME_DIRECTORY}/.bashrc <<EOF

# neovim
alias vi=\"nvim\"
alias vim=\"nvim\"
alias vimdiff=\"nvim -d\"
EOF"
fi
