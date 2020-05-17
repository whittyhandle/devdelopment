#!/bin/bash

account=""
result="could not be found"

while :
do
	acct=$((security find-internet-password -s $account | grep acct | sed 's/"/ /g' | awk '{ print $3 }') 2>&1)
	if [[ "$acct" == *"$result"* ]]; then
		osascript -e 'tell app "System Events" to display notification "Item could not be found" with title "Not Found"'
		break
	else
		security delete-internet-password -a $acct
		osascript -e 'tell app "System Events" to display notification "Finished removing password" with title "Finished"'
	fi
done
exit 0
