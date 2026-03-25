######################################################################

### install git

### dnf/yum
sudo dnf install -y git
sudo yum install -y git

### chocolatey
choco install -y git.install --package-parameters="/NoShellIntegration"
### package parameters
###
### /GitOnlyOnPath
### /GitAndUnixToolsOnPath
### /NoAutoCrlf
### /WindowsTerminal
### /NoShellIntegration
### /NoGuiHereIntegration
### /NoShellHereIntegration
### /NoCredentialManager
### /NoGitLfs
### /SChannel
### /NoOpenSSH
### /WindowsTerminalProfile
### /Symlinks
### /DefaultBranchName:default_branch_name
### /Editor:Nano|VIM|Notepad++|VisualStudioCode|VisualStudioCodeInsiders|SublimeText|Atom|VSCodium|Notepad|Wordpad|Custom editor path

### install git flow avh edition (deprecated)
brew install git-flow-avh

### install git-extras
brew install git-extras

### install gitify
brew install --cask gitify

######################################################################

### debug
GIT_TRACE=1 git push origin main

######################################################################

### config

git config --global --list
git config --local --list
git config --list

git config user.name developer
git config user.email developer@example.com

######################################################################

### initialize repo
git init

### clone repo
git clone <REPO_URL>
git clone --recurse-submodules <REPO_URL>
function git-clone-lower() { REPO_URL="${1}"; DIR_NAME="${2}"; if [ -n "${DIR_NAME}" ]; then REPO_NAME="${DIR_NAME}"; else REPO_NAME=$(basename "${REPO_URL}" .git | tr '[:upper:]' '[:lower:]'); fi; echo "+ git clone ${REPO_URL} ${REPO_NAME}">&2; command git clone ${REPO_URL} ${REPO_NAME}; }

######################################################################

### create a new repository on the command line

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

### commit
git commit -m "initial commit"
git commit -m "update" --allow-empty
git commit --message "update" --allow-empty

### tag
git tag -a v1.0.0 -m "version 1.0.0"

######################################################################

### add files to staging area
git add --all
git add --no-all
git add --update

git rm --cached filename.txt
git rm --cached -r dirname/

######################################################################

### fetch
git fetch
git fetch origin
git fetch --all

### pull
git pull origin
git pull origin main
git pull origin main --ff-only
git pull origin main --rebase

### push
git push origin main
git push --force origin main
git push --no-verify

######################################################################

### move remote repository to another
git fetch origin --all
git fetch origin --tags

git branch -a
git tag -l

gh repo create $(basename "$PWD") --private
git remote add new-origin https://github.com/codejsha/$(basename "$PWD").git

git push new-origin 'refs/remotes/origin/*:refs/heads/*'
git push new-origin --tags

gh repo edit --default-branch main
# gh repo edit --default-branch master
# gh repo edit --default-branch develop

######################################################################

### sync forked repository with the original repository
git remote add upstream ${UPSTREAM_REPO_URL}
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

######################################################################

### branch

### list branches
git branch
git branch -a

### create a new branch
git branch feature/TASK-1234
git checkout -b feature/TASK-1234
git switch -c feature/TASK-1234

### rename branch (master to main)
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a

### delete merged branches
git branch --merged | grep -vE '(main|develop|\*)' | xargs git branch -d

######################################################################

### merge
git merge develop
git merge --no-ff develop
git merge --squash --ff feature/TASK-1234

### rebase
git rebase develop

### cherry-pick
git cherry-pick ${COMMIT_HASH}

### reset
git reset --hard origin/main
git reset --hard origin/develop

######################################################################

### remote
git remote -v
git remote add origin http://git.example.com/developer/my-app.git
git remote set-url origin http://git.example.com/developer/my-app.git
git remote remove origin

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
git restore --staged filename.txt

git restore src/models/schema.rs

######################################################################

### log
git log
### author/committer info
git log --pretty=full -1
### signature verification
git log --show-signature
### graph
git log --graph --oneline
git log --graph --oneline --decorate --all
git log --graph --oneline --all
### stat
git log --stat

### show
git show ${COMMIT_HASH}

######################################################################

### track files

### list tracked files
git ls-files
git ls-files README.md
git ls-files src/

### remove tracked files
git rm --cached README.md
git rm --cached -r docs/

######################################################################

### manage the information of the repository (reference logs)
git reflog

git reset --hard HEAD@{0}

### verify the connectivity and validity of the objects in the database
git fsck --lost-found

git checkout -b ${BRANCH_NAME} ${COMMIT_HASH}

######################################################################

### find commits that modify specific files
git log --all --oneline -- 'src/main/resources/application*.yaml'
git log --all -- '**/.gitignore'
git log --all -p -- '**/.gitignore'

######################################################################

### remove a file history from the git repository

git ls-files

export FILE_PATH="/path/to/file"
git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch ${FILE_PATH}' \
--prune-empty --tag-name-filter cat -- --all

######################################################################

### remove a file or directory history from the git repository (git filter-repo)

git filter-repo --path ${FILE_OR_DIRECTORY} --invert-paths
git filter-repo --path .env.development --invert-paths
git filter-repo --path .env.development --path .env.production --invert-paths
git filter-repo --path credentials/ --invert-paths

git filter-repo --path-glob 'src/main/resources/application*.yaml' --invert-paths

git filter-repo --path src/
git filter-repo --path src/ --path docs/

######################################################################

### submodule
git submodule add https://github.com/codejsha/infrastructure-examples infrastructure

######################################################################
