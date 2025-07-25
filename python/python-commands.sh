######################################################################

### install python

### homebrew
brew install python@3.11

### chocolatey
# choco install -y python3
choco install -y python311 --params "'/InstallDir:$env:USERPROFILE\tools\python3'"
# choco install -y python2 --params "'/InstallDir:$env:USERPROFILE\tools\python2'"

######################################################################

### pip

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

### install
pip3 install diagrams
python3 -m pip install --user ansible
sudo /usr/bin/python3 -m pip install ansible

### uninstall
pip3 uninstall jinja2

### list
pip3 list

######################################################################

### virtualenv

### install
brew install virtualenv

### create venv
virtualenv --python /usr/bin/python3 venv
virtualenv --python /opt/homebrew/bin/python3 venv

### activate
source venv/bin/activate

### deactivate
deactivate

######################################################################

### install poetry
brew install poetry

######################################################################

### install anaconda

### homebrew
brew install --cask anaconda

### chocolatey
choco install -y anaconda3 --params '"/JustMe"'
# choco install -y anaconda3 --params '"/JustMe /AddToPath"'
# choco install -y anaconda3 --params '"/AddToPath /D:C:\Program Files"'
