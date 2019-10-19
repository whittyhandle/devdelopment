#!/bin/bash


#Add command to "Execute Command" in policy:
buttonChoice=$("/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper" -windowType hud -lockHUD -windowPosition ur -title "Update Software" -description "The Chrome version you are running is out-of-date. To update please visit the Self Service application by pressing Continue and select *Update my Google Chrome*" -alignDescription center -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/FileVaultIcon.icns" -button1 "Continue" -defaultButton 1)

echo "$buttonChoice"
if [[ $buttonChoice == "0" ]]; then

	#osascript -e 'tell application "System Events" 
	open -a "/Applications/Self Service.app"
fi
exit 0
