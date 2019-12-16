#!/bin/bash

loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }') #reads current logged in user
plist="/Users/$loggedInUser/Desktop/com.microsoft.SkypeForBusiness.plist" # only modify this line 
#echo "$loggedInUser" #used for troubleshooting

##############################################
### do not modify anything below this line ###
##############################################

skypeReadOut=$(defaults read $plist shouldPromptForJoinMeetingType)
#echo $skypeReadOut #used for troubleshooting

if [[ $skypeReadOut -eq 0 ]]; then #if zero or false set to true
	defaults write $plist shouldPromptForJoinMeetingType -bool true
 	#echo "true" #used for troubleshooting
 	#echo $skypeReadOut #used for troubleshooting
elif [[ $skypeReadOut -eq 1 ]]; then # if one or true set to false
	defaults write $plist shouldPromptForJoinMeetingType -bool false
	#echo "false" #used for troubleshooting
	#echo $skypeReadOut	#used for troubleshooting
fi
