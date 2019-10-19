#!/bin/bash

#stat /dev/console 
# looks to see logged in user 
#stat -f%Su /dev/console
# -f field 

#_currentUser=$(stat -f%Su /dev/console)
#_ used for global variable | no underscore for local variables 
#_currentUserHomeFolder=$(dscl . read /Users/$_currentUser NFSHomeDirectory | awk '{print $NF}')

#echo $_currentUser $_currentUserHomeFolder


#_currentUser=$(stat -f%Su /dev/console)
#_currentUserHomeFolder=$(dscl . read /Users/$_currentUser NFSHomeDirectory | awk '{print $NF}')

#defaults write "$_currentUserHomeFolder/Librarary/Preferences/com.krill.CodeRunner.plist" CloseBrackertsEnabled -bool false 

#defaults write "$_currentUserHomeFolder/Librarary/Preferences/com.krill.CodeRunner.plist" DefaultTabModeSoftTabs -bool true

#defaults write "$_currentUserHomeFolder/Librarary/Preferences/com.krill.CodeRunner.plist" DefaultTabModeWidth -integer 2


