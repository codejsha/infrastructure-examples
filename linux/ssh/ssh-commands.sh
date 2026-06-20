######################################################################

### generate ssh key
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_github_personal
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_github_personal -C "github_personal"

### print public key
cat ~/.ssh/id_ed25519_github_personal.pub
cat ~/.ssh/id_ed25519_github_personal.pub | pbcopy

######################################################################

### generate ssh key
ssh-keygen -t ed25519
### copy public key to remote server
ssh-copy-id user@host

######################################################################

### register ssh key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

### list registered ssh keys
ssh-add -l

### remove all registered ssh keys
ssh-add -D

######################################################################

### connect to ssh server
ssh user@host
ssh -p 2222 user@host
ssh -i ~/.ssh/id_ed25519 user@host

### connection test to github
ssh -T git@github.com
ssh github-personal

######################################################################

### scp
scp file.txt user@host:/remote/path/
scp -P 2222 file.txt user@host:/remote/path/
scp -i ~/.ssh/id_ed25519 file.txt user@host:/remote/path/
scp -r $local_directory user@host:/remote/path/

### rsync
rsync -avz file.txt user@host:/remote/path/
rsync -avz -e "ssh -p 2222" file.txt user@host:/remote/path/
rsync -avz ./dir/ user@host:/remote/path/

######################################################################

### configure authentication method
sudo tee /etc/ssh/sshd_config.d/200-hardening.conf > /dev/null <<'EOF'
PasswordAuthentication no
KbdInteractiveAuthentication no
PubkeyAuthentication yes
EOF
