#!/bin/bash

#Global variables - Edit these variables

#Variable for the JSS URL, include HTTPS and :8443. DO not use a trailing /
jssURL=""

#Variable for the user that we are using to login
jssUser=""

#Variable for the password for the user logging in
jssPass=""

#Do not edit these variables

index="0"
id=""
/usr/bin/curl -k -u $jssUser:$jssPass $jssURL/JSSResource/computers -X GET -o /tmp/computers.xml
computers=`/bin/cat /tmp/computers.xml | xpath //computers/size | sed 's/<[^>]*>//g'`


#Get JSS ID of each computer, check if it is managed. If it is not, update the location information. 

while [ $index -lt $computers ]
do
	index=$[$index+1]
	id=`/bin/cat /tmp/computers.xml | xpath //computers/computer[${index}]/id | sed 's/<[^>]*>//g'`
	/usr/bin/curl -k -u $jssUser:$jssPass "$jssURL/JSSResource/computers/id/$id/subset/General&Location" -X GET > /tmp/computer.xml
	managed=`cat /tmp/computer.xml | xpath //computer/general/remote_management/managed`
	
		if  [[ $managed == "<managed>false</managed>" ]]; then
			/usr/bin/curl -k -u $jssUser:$jssPass $jssURL/JSSResource/computers/id/$id -T /tmp/computer.xml -X PUT
		fi	
		rm /tmp/computer.xml
done

#clean up data
rm /tmp/computers.xml

exit 0