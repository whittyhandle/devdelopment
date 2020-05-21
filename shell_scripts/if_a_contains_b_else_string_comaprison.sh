#!/bin/bash

account="secureschool.lawnside.nj.k12us.com"
result="could not be found"
count=0 

while :
do
	acct=$((security find-internet-password -s $account | grep acct | sed 's/"/ /g' | awk '{ print $3 }') 2>&1)
	if [[ "$acct" == *"$result"* ]]; then
		if [ $count -eq 0 ]; then
			osascript -e 'tell app "System Events" to display notification "Item could not be found" with title "Not Found"'
			break
		else
			osascript -e 'tell app "System Events" to display notification "Finished removing password" with title "Finished"'
			break
		fi
	else
		security delete-internet-password -a $acct
		count=1

		
	fi
done

osascript -e 'tell app "System Events" to display notification "reboot" with title "reboot"'

sleep 30

shutdown -r now 

exit 0
