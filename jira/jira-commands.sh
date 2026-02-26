######################################################################

brew tap atlassian/homebrew-acli
brew install acli

acli --version

######################################################################

echo $TOKEN | acli jira auth login --site "mysite.atlassian.net" --email "user@atlassian.com" --token

