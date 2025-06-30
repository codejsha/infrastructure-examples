######################################################################

alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

######################################################################

### install neovim

### dnf/yum
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install -y neovim python3-neovim

### apt
sudo apt-get install -y neovim
sudo apt-get install -y python3-neovim

### homebrew
brew install neovim

### chocolatey
choco install -y neovim
choco install -y neovim --package-parameters="/NeovimOnPathForAll"

######################################################################

u       # undo
Ctrl-r  # redo

######################################################################

### cursor movement

Ctrl-f  # Down page
Ctrl-b  # Up page
Ctrl-d  # Down half page
Ctrl-u  # Up half page

0   # beginning of line
$   # end of line

w   # forward word
b   # backward word

######################################################################

### window management

Ctrl-w s    # split window horizontally
Ctrl-w v    # split window vertically
Ctrl-w c    # close window
Ctrl-w w    # switch window

######################################################################
