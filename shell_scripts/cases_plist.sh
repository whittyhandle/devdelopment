#!/bin/bash
loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }') #reads current logged in user
plist="/Users/$loggedInUser/Desktop/com.microsoft.SkypeForBusiness"
echo "$loggedInUser"
skypeReadOut=`defaults read $plist shouldPromptForJoinMeetingType` # read the plist looks for value of zero or one 
echo "$skypeReadOut"
case "$skypeReadOut" in
	0) sudo -u $loggedInUser defaults write $plist shouldPromptForJoinMeetingType -bool true
	echo "changed to true"
	;;
	1) sudo -u $loggedInUser defaults write $plist shouldPromptForJoinMeetingType -bool false
	echo "changed to false"
	;;
	*) echo "Error occured"
esac
