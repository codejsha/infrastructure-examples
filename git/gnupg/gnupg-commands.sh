######################################################################

### install gnupg
brew install gnupg

######################################################################

### install pinentry

brew install pinentry
brew install pinentry-mac

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

### change trust level

gpg --edit-key "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
# gpg> trust
# ...
# Please decide how far you trust this user to correctly verify other users' keys
# (by looking at passports, checking fingerprints from different sources, etc.)
#
#   1 = I don't know or won't say
#   2 = I do NOT trust
#   3 = I trust marginally
#   4 = I trust fully
#   5 = I trust ultimately
#   m = back to the main menu
#
# Your decision?
# ...

# gpg> save

######################################################################

### encrypt file

gpg --symmetric --output filename.encrypted filename

######################################################################

### restart gpg-agent
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
