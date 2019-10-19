#!/bin/bash
####################################################################################################
#
# Copyright (c) 2014, JAMF Software, LLC.  All rights reserved.
#
#       Redistribution and use in source and binary forms, with or without
#       modification, are permitted provided that the following conditions are met:
#               * Redistributions of source code must retain the above copyright
#                 notice, this list of conditions and the following disclaimer.
#               * Redistributions in binary form must reproduce the above copyright
#                 notice, this list of conditions and the following disclaimer in the
#                 documentation and/or other materials provided with the distribution.
#               * Neither the name of the JAMF Software, LLC nor the
#                 names of its contributors may be used to endorse or promote products
#                 derived from this software without specific prior written permission.
#
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
####################################################################################################
#Set variables here:
jssUser="admin"						#JSS username
jssPass="jamf12345"						#JSS password
jssURL="https://ender.q.jamfsw.corp:8443" 						#JSSURL

#No configuration variables below this line.  You should not need to edit unless you are modifying functionality
#####################################################################################################
tmp="/tmp/temp.txt"
tmp2="/tmp/temp2.txt"


#Get a list of policies and format xml 
curl -k -v -u $jssUser:$jssPass $jssURL/JSSResource/policies -X GET | xmllint --format - > $tmp

#read temp.txt remove html tags output results temp.txt 
echo `cat $tmp | grep \</id\>` > $tmp 

#Loop through Policies Id's 
while read id 
	do 
		for word in $id
			do 
			
				#remove html tags 
				noTag=`echo $word | sed 's/<[^>]*>//g'`
				
				#get policies with matching ids formating  xml output results to temp2 
				curl -k -v -u $jssUser:$jssPass $jssURL/JSSResource/policies/id/$noTag -X GET | xmllint --format - > $tmp2
				
				checkin=`cat $tmp2 | grep trigger_checkin`
				checkin=`echo $checkin | sed 's/<[^>]*>//g'`
				if [ $checkin != "true" ]; then
					
					#remove spaces from Execute Command 
					noSpace=`grep -F command $tmp2 | sed 's/<[^>]*>//g' | sed -e 's/^[ ]*//'`
				
					#unmount caspershares
					snoogin="if ls /Volumes/ | grep "casper_dist"; then umount /Volumes/casper_dist; else umount /Volumes/casper; fi; $noSpace"
				
					#insert xml into database 
			 		curl -k -u $jssUser:$jssPass -H "Content-Type: text/xml" $jssURL/JSSResource/policies/id/$noTag -d "<?xml version=\"1.0\" encoding=\"UTF-8\"?><policy><general><id>$noTag</id></general><files_processes><run_command>$snoogin</run_command></files_processes></policy>" -X PUT	
			 	fi					
	done
done < $tmp



