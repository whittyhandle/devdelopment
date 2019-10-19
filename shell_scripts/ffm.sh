#!/bin/bash

FMM=$(defaults read /Library/Preferences/com.apple.FindMyMac.plist FMMEnabled)

[[ $FMM == 0 ]] && result="Disabled" || results="Enabled"

echo "<result>$result</result>"