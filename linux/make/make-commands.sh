######################################################################

### install gnu make
### GNU "make" has been installed as "gmake".

brew install make
PATH="${HOMEBREW_PREFIX}/opt/make/libexec/gnubin:${PATH}"

######################################################################

make --version

######################################################################

make -pnr
make --print-data-base --dry-run --no-builtin-rules --no-builtin-rules

make -pnR
make --print-data-base --dry-run --no-builtin-rules --no-builtin-variables

######################################################################

gmake -pnr
gmake -pnR
