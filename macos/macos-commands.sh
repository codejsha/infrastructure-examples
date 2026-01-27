######################################################################

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool true

defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;

######################################################################

### print macos version
sw_vers
sw_vers -productName
sw_vers -productVersion
sw_vers -buildVersion

######################################################################

### open
open -b com.google.Chrome http://localhost:8080
open -b com.google.Chrome http://localhost:8083

######################################################################

### bundle-identifier

defaults read com.apple.dock persistent-apps | rg bundle-identifier

cat Info.plist | rg -n CFBundleIdentifier -A 1

######################################################################
