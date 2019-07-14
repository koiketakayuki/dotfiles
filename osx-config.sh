#!/usr/bin/env bash

set -ux

# Finder
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder AppleShowAllFiles YES

# Safari
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari ShowStatusBar -bool true

# Docks
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock tilesize -int 64
killall Dock