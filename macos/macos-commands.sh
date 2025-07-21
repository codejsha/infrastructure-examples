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

defaults read /Users/user/Applications/IntelliJ\ IDEA\ Ultimate.app/Contents/Info CFBundleIdentifier
defaults read /Users/user/Applications/DataGrip.app/Contents/Info CFBundleIdentifier

defaults read /Applications/Visual\ Studio\ Code.app/Contents/Info CFBundleIdentifier
defaults read /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Info CFBundleIdentifier

######################################################################

### clear history
history -p

######################################################################

### acrobat reader
brew install --cask adobe-acrobat-reader

### alttab
brew install --cask alt-tab

### appcleaner
brew install --cask appcleaner

### bartender
brew install --cask bartender

### betterdisplay
brew install --cask betterdisplay

### draw.io
brew install --cask drawio

### firefox
brew install --cask firefox

### gather town
brew install --cask gather

### google chrome
brew install --cask google-chrome

### graphviz
brew install graphviz

### groovy sdk
brew install groovysdk

### hyper
brew install --cask hyper

### jetbrains toolbox
brew install --cask jetbrains-toolbox

### karabiner-elements
brew install --cask karabiner-elements

### logitech options+
brew install --cask logi-options-plus

### maccy
brew install --cask maccy

### microsoft edge
brew install --cask microsoft-edge

### microsoft office
brew install --cask microsoft-office

### microsoft remote desktop
brew install --cask microsoft-remote-desktop

### naver whale
brew install --cask naver-whale

### notion
brew install --cask notion

### obsidian
brew install --cask obsidian

### rectangle
brew install --cask rectangle

### setapp
brew install --cask setapp

### slack
brew install --cask slack

### spotify
brew install --cask spotify

### tlrc (tldr)
brew install tlrc

### tunnelblick
brew install --cask tunnelblick
