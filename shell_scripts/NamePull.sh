#!/bin/bash

if [ -z "$1" ] ; then
	# Prompt the user for information to connect to the JSS with
	read -p "JSS URL: " jssurl
	read -p "JSS Username: " jssuser
	read -s -p "JSS Password: " jsspassword
	echo ""
fi

touch /tmp/test.txt

# Set a counter for our 'for' to start at the beginning
index="0"
# Create an array for computer
computers=()

# Get all of the computer records
IDs=`curl -k -u $jssuser:$jsspassword ${jssurl}/JSSResource/computers -X GET`
# Record the number of computers to be put into the array from the returned XML
size=`echo $IDs | xpath //computers/size | sed 's/<[^>]*>//g'`

# Sort the computer IDs into an array (using the start point of index=0 and the size variable as the end point)
while [ $index -lt ${size} ]
do
	index=$[index+1]
	computers+=(`echo $IDs | xpath //computers/computer[${index}]/id | sed 's/<[^>]*>//g'`)
done

# For each computer in the array, do all of these things
for i in "${computers[@]}"
do
	# Tell the terminal which inventory record we're working on
	echo "$(tput setaf 2)Scanning ${i}$(tput sgr0)"
	# Collect the comprehensive inventory information for the current device we're checking in the array
	computer=`curl -s -k -u $jssuser:$jsspassword ${jssurl}/JSSResource/computers/id/${i} -X GET`
	# Filter the information down to the extension attribute to prevent contamination to our greps
	compInfo=`echo $computer | xpath //computer | tidy -xml -utf8 -i | sed 's/<[^>]*>//g'`
	#compName=`echo $computer | grep -A 2 Name`
	compName=`echo $compInfo | cut -d \  -f 2`
	echo $compName >> /tmp/test.txt

done