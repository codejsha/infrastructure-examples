######################################################################

### debug
GIT_TRACE=1 git push origin main

function gclo() { REPO_URL="${1}"; DIR_NAME="${2}"; if [ -z "${DIR_NAME}" ]; then REPO_NAME="${DIR_NAME}"; else REPO_NAME=$(basename "${REPO_URL}" .git | tr '[:upper:]' '[:lower:]'); fi; echo "+ git clone ${REPO_URL} ${REPO_NAME}">&2; command git clone ${REPO_URL} ${REPO_NAME}; }

######################################################################

### create a new repository on the command line

echo "# hello-world" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/codejsha/hello-world.git
git push -u origin main

### push an existing repository from the command line

git remote add origin https://github.com/codejsha/hello-world.git
git branch -M main
git push -u origin main

######################################################################

### repo
git init

### remote
git remote add origin http://git.example.com/developer/my-app-ci.git
git remote add origin http://git.example.com/developer/my-app-cd.git
git remote set-url origin http://git.example.com/developer/my-app-ci.git
git remote set-url origin http://git.example.com/developer/my-app-cd.git

### submodule
git submodule add https://github.com/codejsha/infrastructure-examples infrastructure

######################################################################

### config

git config --global --list
git config --local --list
git config --list

git config user.name developer
git config user.email developer@example.com

######################################################################

### collaborate

### fetch
git fetch --all

### pull
git pull origin
git pull origin main

### push
git push origin main
git push --force origin main
git push --no-verify

######################################################################

### add
git add --all
git add --no-all
git add --update

######################################################################

### branch
git checkout -b develop
git swtich develop

### commit
git commit -m "update" --allow-empty
git commit --message "update" --allow-empty

### merge
git merge develop
git merge --no-ff develop
git merge --squash --ff feature/TASK-1234

### rebase
git rebase develop

### reset
git reset --hard origin/main

### switch
git switch main

### tag
git tag -a v1.0.0 -m "version 1.0.0"

######################################################################

### status
git status
git status --untracked-files=no

### patch
git diff ${COMMIT_HASH} > diff.patch
git diff ${COMMIT_HASH1} ${COMMIT_HASH2} > diff.patch
git apply diff.patch

### stash
git stash
git stash list
git stash pop
git restore --source=stash@{0} -- ./tomcat/helper.sh

### log
git log
### graph
git log --graph --oneline
git log --graph --oneline --decorate --all
git log --graph --oneline --all
### stat
git log --stat

### show
git show ${COMMIT_HASH}

######################################################################

### manage the information of the repository (reference logs)
git reflog

git reset --hard HEAD@{0}

### verify the connectivity and validity of the objects in the database
git fsck --lost-found

git checkout -b <branch-name> <commit-hash>

######################################################################

git ls-files

git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch ${FILE_PATH}' \
--prune-empty --tag-name-filter cat -- --all
