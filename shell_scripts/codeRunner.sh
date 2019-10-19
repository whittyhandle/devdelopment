#!/bin/bash

_currentUser=$(stat -f%Su /dev/console)
_currentUserHomeFolder=$(dscl . read /Users/$_currentUser NFSHomeDirectory | awk '{print $NF}')

defaults write "$_currentUserHomeFolder/Desktop/Preferences/com.krill.CodeRunner.plist" CloseBrackertsEnabled -bool false 
defaults write "$_currentUserHomeFolder/Desktop/Preferences/com.krill.CodeRunner.plist" DefaultTabModeSoftTabs -bool true
defaults write "$_currentUserHomeFolder/Desktop/Preferences/com.krill.CodeRunner.plist" DefaultTabModeWidth -integer 2

#can upload to jss and deploy but you'll need to convert to xml using plutil 