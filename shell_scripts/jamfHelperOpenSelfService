#!/bin/bash

jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
response=$("$jamfHelper" -description "To update please visit the Self Service application by pressing Continue and select *Update my Google Chrome*" -alignDescription left -iconSize 50 -cancelButton 2 -windowType hud -title "Software Update Notification"  -button2 "Cancel" -alignHeading left -button1 "Continue" -defaultButton 1 -heading "The Chrome version you are running is out-of-date" -lockHUD)
echo $response
[[ $response -eq 2 ]] && exit 1 || open -a "/Applications/Self Service.app"
