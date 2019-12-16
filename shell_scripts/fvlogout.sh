#!/bin/bash

#Add command to "Execute Command" in policy:
buttonChoice=$("/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper" -windowType hud -lockHUD -windowPosition ur -title "Enable FileVault" -description "FileVault must be enabled on this computer. Please save your work and click "Log Out" to begin the process." -alignDescription center -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/FileVaultIcon.icns" -button1 "Log Out" -defaultButton 1)

echo "$buttonChoice"
if [[ $buttonChoice == "0" ]]; then

	osascript -e 'tell application "System Events" to keystroke "q" using {command down, option down, shift down}'
fi
exit 0
