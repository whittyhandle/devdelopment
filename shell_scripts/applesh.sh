#!/bin/bash

jh="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"

#"$jh" -help 
returnCode=$("$jh" -windowType hud -description " Check self service" -button1 "OK" -defaultButton 1 -button2 "cancel" -showDelayOptions "0, 60, 120, 900, 3600")
echo "the  time selected was: ${returnCode%?}"
echo "${returnCode%1}"

#/System/Library/CoreServices/CoreTypes.bundle
#/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources