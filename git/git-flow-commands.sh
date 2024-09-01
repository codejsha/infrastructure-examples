######################################################################
### Git flow AVH edition (deprecated)
######################################################################

### feature branch

### list/start/finish/delete feature branches
git flow feature
git flow feature start <name> [<base>]
git flow feature finish <name>
git flow feature delete <name>

### publish/track a feature branch
git flow feature publish <name>
git flow feature track <name>

######################################################################

### release branch

### list/start/finish/delete release branches
git flow release
git flow release start <release> [<base>]
git flow release finish <release>
git flow release delete <release>

######################################################################

### hotfix branch

git flow hotfix
git flow hotfix start <release> [<base>]
git flow hotfix finish <release>
git flow hotfix delete <release>

######################################################################

### list/start support branches
git flow support
git flow support start <release> <base>
