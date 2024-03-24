# disable dashboard
defaults write com.apple.dashboard mcx-disabled -bool true killall Dock

# no smooth scrolling
defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

# no auto period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# 50 recent items items
defaults write NSGlobalDomain NSRecentDocumentsLimit -int 50

# Pros: Faster key repeats for coding.
# Cons: Disables press-and-hold to choose accents and special characters.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Pros: Changes minimize effect to scale instead of genie, slightly faster.
# Cons: Aesthetic preference.
defaults write com.apple.dock mineffect -string "scale" killall Dock

# Pros: Additional options for working with disks.
# Cons: Potentially dangerous operations become available.
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

# show lib in finder
chflags nohidden ~/Library

# prevent .DS_Store from being created
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# faster key repeat
defaults write NSGlobalDomain KeyRepeat -int 0

# always show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# apple product debug menus
defaults write com.apple.appstore ShowDebugMenu -bool true

# Increase Window Resize Speed: Makes window resizing more responsive.
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Add "Quit" Option to Finder: Allows you to completely quit Finder.
defaults write com.apple.finder QuitMenuItem -bool true
killall Finder

# use quartz gpu for rendering improvement, turn off with one beneath if glitchy
defaults write com.apple.QuartzGL enable -bool true
# defaults write com.apple.QuartzGL enable -bool false
#
# Enable Auto-Hide for the Dock with No Delay:
defaults write com.apple.dock autohide-time-modifier -int 0 killall Dock

#Enable HiDPI Display Modes:
# Explanation: Enables HiDPI modes for Retina testing on non-Retina displays.
# Pros: Simulates Retina display for development and testing.
# Cons: Requires logout/login; may cause display issues.
#
# i may have done this one, but just keep in mind and undo if weird on restart
#
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
