#!/bin/sh

myUsername=$(defaults read `/Library/Preference/com.apple.loginwindow lantUserName`)
echo $myUsername