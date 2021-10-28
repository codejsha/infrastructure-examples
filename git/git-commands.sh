######################################################################

### repo

git init

######################################################################

### config

git config user.name developer
git config user.email developer

######################################################################

### remote

git remote add origin http://git.example.com/developer/my-app-ci.git
git remote add origin http://git.example.com/developer/my-app-cd.git

git remote set-url origin http://git.example.com/developer/my-app-ci.git
git remote set-url origin http://git.example.com/developer/my-app-cd.git

######################################################################

### branch

git checkout -b main

######################################################################

### status

git status
git status --untracked-files=no

######################################################################

### commit

git commit -m "update" --allow-empty

######################################################################

### push

git push origin main
git push --force origin main

######################################################################

### stash

git stash
git stash list
git stash pop

git restore --source=stash@{0} -- ./tomcat/helper.sh

######################################################################

### submodule

git submodule add https://github.com/codejsha/infrastructure infrastructure
