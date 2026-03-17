######################################################################

atuin --help
atuin --version

atuin info

######################################################################

### statistics
atuin stats

### history
atuin search curl

######################################################################

### delete all history
atuin search --delete-it-all
atuin search --delete-it-all --exclude-exit=0

### delete history with filter
atuin search --delete --exclude-exit=0 docker
atuin search --delete --exclude-exit=0 curl
atuin search --delete hostctl

### delete duplicate history
atuin history dedup --before now --dupkeep=1
