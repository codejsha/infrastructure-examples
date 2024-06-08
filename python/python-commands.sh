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

### create venv
virtualenv --python /usr/bin/python3 venv
virtualenv --python /opt/homebrew/bin/python3 venv

### activate
source venv/bin/activate

### deactivate
deactivate
