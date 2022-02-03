######################################################################

### repo
git init

######################################################################

### config

git config --global --list
git config --local --list

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

### add
git add --all
git add --no-all
git add --update

######################################################################

### status
git status
git status --untracked-files=no

######################################################################

### fetch
git fetch --all

######################################################################

### commit
git commit -m "update" --allow-empty
git commit --message "update" --allow-empty

######################################################################

### pull
git pull origin
git pull origin main

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

### reset
git reset --hard origin/main

######################################################################

### submodule
git submodule add https://github.com/codejsha/infrastructure infrastructure
