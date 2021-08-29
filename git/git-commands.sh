######################################################################

### status

git status
git status --untracked-files=no

######################################################################

git commit -m "update" --allow-empty

######################################################################

### stash

git stash
git stash list
git stash pop

git restore --source=stash@{0} -- ./tomcat/helper.sh
