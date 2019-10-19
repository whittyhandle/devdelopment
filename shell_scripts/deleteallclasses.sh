#!/bin/bash
#
########################################################################################################
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
# DESCRIPTION
#
#	This script deletes computer records from the JSS by their name based
#	on input from a delimited (by newline) text file.
#
#	<!> MAKE A DATABASE BACKUP BEFORE EXECUTING THIS SCRIPT <!>
#
####################################################################################################
#
# HISTORY
#
#	Version 1.0
#  	Created by Nick Anderson, JAMF Software, LLC, on September 14, 2015
#
####################################################################################################

if [ -z "$1" ] ; then
	# Prompt the user for information to connect to the JSS with
	read -p "JSS URL: " jssurl
	read -p "JSS Username: " jssuser
	read -s -p "JSS Password: " jsspassword
	echo ""
else
	# Quick testing credentials, run the script as ./script.sh bananachameleontomato1234 to use this mode
	jssurl="https://yer-jss.quick.jamfsw.corp:8443"
	jssuser="admin"
	jsspassword="jamf1234"
fi

# Set a counter for our 'for' to start at the beginning
index="0"
# Create an array for computer
computers=()

# Get all of the computer records
IDs=`curl -k -u $jssuser:$jsspassword ${jssurl}/JSSResource/classes -X GET`
# Record the number of computers to be put into the array from the returned XML
size=`echo $IDs | xpath //classes/size | sed 's/<[^>]*>//g'`
echo $ID

# Sort the computer IDs into an array (using the start point of index=0 and the size variable as the end point)
while [ $index -lt ${size} ]
do
	index=$[index+1]
	computers+=(`echo $IDs | xpath //classes/class[${index}]/id | sed 's/<[^>]*>//g'`)
	echo $computer 
done

# For each computer in the array, do all of these things
for i in "${computers[@]}"
do
	# Tell the terminal which inventory record we're working on
	echo "$(tput setaf 2)Deleting ${i}$(tput sgr0)"
	# Collect the comprehensive inventory information for the current device we're checking in the array
	curl -v -k -u $jssuser:$jsspassword ${jssurl}/JSSResource/classes/id/${i} -X DELETE
done

