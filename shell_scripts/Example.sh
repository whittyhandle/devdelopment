#!/bin/bash

#Set variables here:
jssUser="admin"							#JSS username
jssPass="jamf1234"						#JSS password
jssURL="https://ender.local:8443/"		#Trailing slash required


index="0"
peripherals=()

#Get a list of peripherals
IDs=`curl -k -v -u $jssUser:$jssPass ${jssURL}JSSResource/peripherals -X GET`
size=`echo $IDs | xpath //peripherals/size | sed 's/<[^>]*>//g'`

#Show how many peripherals will be deleted
echo "Size: " $size

#Put the IDs into an array
while [ $index -lt ${size} ] 
do	
	index=$[$index+1]
	peripherals+=(`echo $IDs | xpath //peripherals/peripheral[${index}]/id | sed 's/<[^>]*>//g'`)
done

#Show the IDs of all peripherals that will be deleted
echo "Peripherals: " ${peripherals[@]}

#Delete each peripheral by ID
for i in "${peripherals[@]}"
do
	curl -k -v -u $jssUser:$jssPass ${jssURL}JSSResource/peripherals/id/${i} -X DELETE
done