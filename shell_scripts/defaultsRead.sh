#!/bin/bash

#defaults read com.apple.loginwindow 

#sudo defaults read com.apple.loginwindow

#defaults -currentHost read  com.apple.loginwindow

#defaults read /Library/Preferences/caom.apple.loginwindow

#defaults read -app /System/Library/CoreServices/loginwindow.app/

#defaults read -g 
#^looks at global domain 

#defaults write -g NSAutomaticCapitalizationEnabled -bool true

#defaults read com.apple.dock 

#defaults write com.apple.dock orientation left
#killall Dock 
#defaults delete com.apple.dock orientation 

#defaults write ~/Desktop/user.plist username localadmin 

#defaults write ~/Desktop/date.plist CurrentDate -date "$(date -u +%F\ %T\ %t)"
#add -u to change to UTC "+" formats %S epoch %F %T %t off sets to 

#defaults write ~/Desktop/user.plist attributes -dict-add uniqueid 501
#need a keyvalue pair -dict-add 
#defaults write ~/Desktop/user.plist attributes -dict-add homedirectory "/Users/localadmin"
#important note: computer dict not in any order 