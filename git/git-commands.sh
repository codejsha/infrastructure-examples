######################################################################

### config

git config --global --list
git config --local --list

git config user.name developer
git config user.email developer@example.com

######################################################################

### repo
git init

### remote
git remote add origin http://git.example.com/developer/my-app-ci.git
git remote add origin http://git.example.com/developer/my-app-cd.git
git remote set-url origin http://git.example.com/developer/my-app-ci.git
git remote set-url origin http://git.example.com/developer/my-app-cd.git

### fetch
git fetch --all

### pull
git pull origin
git pull origin main

### push
git push origin main
git push --force origin main

### status
git status
git status --untracked-files=no

### stash
git stash
git stash list
git stash pop
git restore --source=stash@{0} -- ./tomcat/helper.sh

######################################################################

### branch
git checkout -b develop
git swtich develop

### add
git add --all
git add --no-all
git add --update

### commit
git commit -m "update" --allow-empty
git commit --message "update" --allow-empty

### reset
git reset --hard origin/main

### patch
git diff $COMMIT_HASH > diff.patch
git diff $COMMIT_HASH1 $COMMIT_HASH2 > diff.patch
git apply diff.patch

######################################################################

### debug

GIT_TRACE=1 git push origin main

######################################################################

### submodule
git submodule add https://github.com/codejsha/infrastructure-examples infrastructure
