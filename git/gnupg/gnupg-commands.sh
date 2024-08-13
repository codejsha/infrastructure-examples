######################################################################

gpg --gen-key
gpg --list-keys

######################################################################

### config global

git config --global user.name "USER_NAME"
git config --global user.email "USER_EMAIL"
git config --global user.signingkey "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
git config --global commit.gpgsign true
git config --global gpg.program gpg
# git config --global gpg.program $(which gpg)

### config local repository (inside repository)

git config user.name "USER_NAME"
git config user.email "USER_EMAIL"
git config user.signingkey "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
git config commit.gpgsign true
git config gpg.program gpg
# git config gpg.program $(which gpg)

######################################################################

### export public key
gpg --list-keys
gpg --armor --export "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
gpg --armor --export "ABCDEFGHIJKLMNOPQRSTUVWXYZ" > public.key

### export secret key
gpg --list-secret-keys
gpg --armor --export-secret-keys "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
gpg --armor --export-secret-keys "ABCDEFGHIJKLMNOPQRSTUVWXYZ" > private.key

######################################################################

### expand key expiration

gpg --edit-key "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
# gpg> expire
# Changing expiration time for the primary key.
# Please specify how long the key should be valid.
#          0 = key does not expire
#       <n>  = key expires in n days
#       <n>w = key expires in n weeks
#       <n>m = key expires in n months
#       <n>y = key expires in n years
# Key is valid for? (0)
# ...
# gpg> save

# gpg> key 1
# gpg> expire
# ...
# gpg> save

######################################################################

gpg --symmetric --output filename.encrypted filename
