#!/bin/bash
sudo defaults write /Library/Preferences/com.apple.dock contents-immutable -bool true
sleep 1
killall Dock