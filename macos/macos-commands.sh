######################################################################

defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;

######################################################################

### print macos version
sw_vers
sw_vers -productName
sw_vers -productVersion
sw_vers -buildVersion

######################################################################

### bundle-identifier

defaults read com.apple.dock persistent-apps | rg bundle-identifier

cat Info.plist | rg -n CFBundleIdentifier -A 1

######################################################################

### ohmyzsh

### als
als
als -h
als <keyword>
als -g <group>
als --groups

### forklift (fl)
fl
