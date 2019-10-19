#!/bin/sh

#####################################################################################################
#
# Copyright (c) 2014, JAMF Software, LLC.  All rights reserved.
#
#       This script was written by Mike Scafide with some code shamelessly stolen from 
#		Douglas Worley and Justin Ingebretson's APNs_Port_Tool.sh
#
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#####################################################################################################
#
#		This JAMF Helper Script will walk through and check if the ports required for
#		APN communication are open. After it does the check, it will look to see
#		if the Mac has an APN Token on the device. If there is no token present,
#		it will attempt to fix.
#
#####################################################################################################
#
#version 0.1 by Mike Scafide
#
#####################################################################################################

# Hard code the information for your JSS server here
jssUrl="https://ender.q.jamfsw.corp"			# such as:	jss.company.com
jssContext="" 		# such as:	/context 		<-- This can be left blank
jssPort="8443"			# such as: 	8443

#These URLs likely won't change, but if they do you can do update them here:
url2195="gateway.sandbox.push.apple.com"
url2196="gateway.sandbox.push.apple.com"
url5223="35-courier.push.apple.com"
url443="albert.apple.com"

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "This Script will check if your Mac has all the required APN ports open, and will then check for the APN Token from Apple." -button1 "Start!" `

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 2195 is required for traffic from the JSS to Apple." -button1 "Check!" `

jssToAppleOut=`nc -z $url2195 2195`
if [[ "$jssToAppleOut" == *succeeded* ]]
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 2195 is open!" -button1 "Great!" `
else
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 2195 is not open. Please open to allow APNs connectivity." -button1 "Continue." `
fi

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 2196 is required for feedback from Apple to the JSS." -button1 "Check!" `

#Port 2196
jssToAppleFeedback=`nc -z $url2196 2196`
if [[ "$jssToAppleFeedback" == *succeeded* ]]
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 2196 is open!" -button1 "Great!" `
else
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 2196 is not open. Please open to allow APNs feedback to the JSS." -button1 "Continue." `
fi

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 5223 is required for traffic from the APN Servers to your managed devices." -button1 "Check!" `

#Port 5223
deviceToApple=`nc -z $url5223 5223`
if [[ "$deviceToApple" == *succeeded* ]]
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 5223 is open!" -button1 "Great!" `
else
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 5223 is not open. Please open to allow traffic from the APN Servers to your managed devices." -button1 "Continue." `
fi

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 443 is required for fallback traffic from your managed devices to Apple." -button1 "Check!" `

#Port 443
deviceToAppleFallback=`nc -z $url443 443`
if [[ "$deviceToAppleFallback" == *succeeded* ]]
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 443 is open!" -button1 "Great!" `
else
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 443 is not open. Please open to allow fallback traffic from your managed devices to the Apple." -button1 "Continue." `
fi

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 8443 is required for traffic from your managed devices to the JSS." -button1 "Check!" `

#Port 8443
deviceToJss=`nc -z $jssUrl $jssPort`
if [[ "$deviceToJss" == *succeeded* ]]
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 8443 is open!" -button1 "Great!" `
else
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Port 8443 is not open. Please open to allow traffic from your managed devices to the JSS." -button1 "Continue." `
fi

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "We will check if your Mac has an APN Token from Apple." -button1 "Check!" `

#The Script will check for an APN Token on the Mac

file="/private/var/db/ConfigurationProfiles/MDM_ComputerPrefs.plist"

if [ -f "$file" ]
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "This Mac has recieved an APN Token From Apple." -button1 "Great!" `
exit
else
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "This Mac has not recieved an APN Token From Apple." -button1 "Ok" `
fi

if [ "$result" == 0 ]; 
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Attempt to fix?" -button1 "Yes" -button2 "No" `
fi

#The Script will then run a sudo jamf manage if option 1 is checked and will then check for the token again.

if [ "$result" == 0 ]; 
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Attempting to fix. This will take a couple seconds." -button1 "Ok" ` 

result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "Attempting to fix. This will take a couple seconds." -timeout 15 -countdown "Ok" ` &

sudo jamf removeMdmProfile

sleep 5

sudo jamf manage

sleep 5

fi

if [ -f "$file" ]
then
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "This Mac has recieved an APN Token From Apple." -button1 "Great!" `
exit
else
result=` /Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -lockHUD -title "APN Port & Token Check" -icon /System/Library/CoreServices/Finder.app/Contents/Resources/iCloud.pdf -iconSize pixels 800 -description "This Mac has not received an APN Token From Apple. Please verify this Mac is not behind a network proxy, the entire 17.0.0.0/8 range is open in any firewalls, and that Push Notifications are enabled in the JSS. Please go to to Settings > Computer Management > Security in the JSS. More information from Apple can be found here: http://support.apple.com/kb/TS4264" -button1 "Exit" `
fi
exit