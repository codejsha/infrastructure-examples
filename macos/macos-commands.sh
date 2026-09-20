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

sudo launchctl kickstart -k system/com.openssh.sshd

######################################################################

### network adapter - manual ip address

### list network service order
networksetup -listnetworkserviceorder

### set manual ip address
sudo networksetup -setmanual "Ethernet" 192.168.0.2 255.255.255.0 192.168.0.1

### check
ipconfig getifaddr en0

######################################################################

### network adapter - dhcp
sudo networksetup -setdhcp "Ethernet"

######################################################################

### power settings

### read settings
pmset -g

### sleep/wake log
pmset -g log | grep -e " Wake " -e "DarkWake" -e "Sleep"

### power log
log show --last 3h --predicate 'subsystem == "com.apple.powerd"' --info

######################################################################

### format usb disk

diskutil list external

### format disk
diskutil unmountDisk /dev/disk4
diskutil eraseDisk ExFAT USB16 GPT /dev/disk4

### check disk
diskutil list external
