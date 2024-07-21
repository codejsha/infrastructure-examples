######################################################################

function brew() { echo "+ brew ${@}">&2; command brew "${@}"; }

######################################################################

defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;
defaults read com.apple.dock persistent-apps | grep bundle-identifier
