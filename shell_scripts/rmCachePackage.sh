#!/bin/bash

stuckCounter='0';

# Get the stuckFile names from JSS 
stuckFile1=$4
stuckFile2=$5
stuckFile3=$6

# read in files from the Jamf waiting room 
stuckFiles=(`ls /Library/Application\ Support/JAMF/Receipts/`)
 
# for each in the array, do the thing
for i in "${stuckFiles[@]}"
do 
	if [ $i == $stuckFile1 ] || [ $i == $stuckFile2 ] || [ $i == $stuckFile3 ]; then
		rm -rf $i
		stuckCounter=$[$stuckCounter +1]
		
	fi
done
# check to make sure we removed files 
    if [ $stuckCounter == 3 ]; then
 		exit 0 
	else
 		exit 1
 	fi


