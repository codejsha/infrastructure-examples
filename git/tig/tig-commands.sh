######################################################################

brew install tig

######################################################################

tig --all
tig --all --date-order

tig main..develop
tig develop..feature/x

tig -C /path/to/repo

######################################################################

### file history

tig -- README.md
tig --after="2026-09-01" --before="2026-09-30" -- src/
tig show v1.0.0:README.md

######################################################################

### sub commands

tig status
tig log
tig show HEAD~3
tig stash

tig refs
tig reflog

######################################################################

### diff

tig --author="developer"

