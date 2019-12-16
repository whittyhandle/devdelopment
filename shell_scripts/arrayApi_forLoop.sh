#!/bin/bash

getComputerIDs=$(curl -H "accept: application/xml" -sku uname:passwd https://test.jamfcloud.com/JSSResource/computers | xmllint --xpath "/computers/computer/id" - | sed 's/<[^>]*>/ /g') #get computer id's

# different ways to use xpath return is the same 
# curl -sku "accept: application/xml" uname:passwd https://test.jamfcloud.com/JSSResource/computers/id/18 | xmllint --xpath "//filevault_status" - 
# curl -sku uname:passwd https://test.jamfcloud.com/JSSResource/computers/id/18 | xmllint --xpath "//computer/hardware/storage/device/partition/filevault_status" - 

IFS=' ' read -r -a idArray <<< "$getComputerIDs" #populate array 

for i in ${idArray[@]};do #iterate through array
	echo $i 
	getFVinfo=$(curl -H "accept: application/xml" -sku uname:passwd https://test.jamfcloud.com/JSSResource/computers/id/$i | xmllint --xpath "//filevault_status" - | sed 's/<[^>]*>/ /g') #get FV2 info
	echo $getFVinfo
done
