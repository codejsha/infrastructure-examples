######################################################################

gpg --gen-key
gpg --list-key
gpg --armor --export "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

######################################################################

git config --global user.name "USER_NAME"
git config --global user.email "USER_EMAIL"
git config --global user.signingkey "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
git config --global commit.gpgsign true
git config --global gpg.program gpg
# git config --global gpg.program $(which gpg)

######################################################################

git config user.name "USER_NAME"
git config user.email "USER_EMAIL"
git config user.signingkey "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
git config commit.gpgsign true
git config gpg.program gpg
# git config gpg.program $(which gpg)

######################################################################

gpg --symmetric --output filename.encrypted filename
