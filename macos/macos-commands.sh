######################################################################

function brew() { echo "+ brew ${@}">&2; command brew "${@}"; }

######################################################################

defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;

######################################################################

### bundle-identifier

defaults read com.apple.dock persistent-apps | rg bundle-identifier

cat Info.plist | rg -n CFBundleIdentifier -A 1
