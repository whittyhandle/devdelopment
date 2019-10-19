#!/bin/bash
####################################################################################################
#
# Copyright (c) 2013, JAMF Software, LLC.  All rights reserved.
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
####################################################################################################
#
# ABOUT THIS PROGRAM
#
####################################################################################################
#
####################################################################################################
#
# DEFINE VARIABLES & READ IN PARAMETERS
#
# Specify values for these variables to override command line arguments and skip prompts
#
#################################################################################################### 
server="your_JSS_url"							            #Server name
username="your_JSS_username"							    #JSS username with API privileges
password="your_JSS_password"							    #Password for the JSS account
file="/path/to/the/.csv"		                            #Path to CSV
####################################################################################################
#
# CODE BELOW SHOULD NOT BE MODIFIED
#
####################################################################################################



##Count the number of lines in the file so we know how many clients to delete##
count=`cat "${file}" | awk 'END{print NR}'`

##Set a variable to being counting the .csv line to be submitted##
index="0"

##Loop through the .csv and submit the ID numbers of the peripherals to cull##
##in the JSS until we've reached the end of the .csv##
while [ $index -lt ${count} ] 
do
	##Increment our counter by 1 for each iteration##
	index=$[$index+1]
	
	##Set unique variables to read the next line in the .csv##
	var1=`cat "${file}" | awk -F, 'FNR == '$[$index]' {print $1}'`


  

##Submit the .csv data to the JSS via the JSS API##
curl -k -v -u ${username}:${password} https://${server}:8443/JSSResource/peripherals/${var1} -X DELETE

done

exit 0
