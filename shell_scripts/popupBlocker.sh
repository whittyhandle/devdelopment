#!/bin/sh

#enable pop up blocker
#defaults write ~/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool true
#can't use above beasue we need to specify the users per script  ~ means /User/yourUserName

name=`defaults read /Library/Preferences/com.apple.loginwindow lastUserName`

defaults write /Users/$name/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool true
That'll grab the current username then fill it into the write command


exit 0