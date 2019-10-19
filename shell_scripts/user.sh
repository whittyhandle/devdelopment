#!/bin/bash

for user in $(dscl . list /Users);do 
 homeFolder=$(dscl . read /Users/$user NFSHomeDirectory | awk '{print $2}')
 uid=$(dscl . read /Users/test UniqueID | awk '{print $2}')
 echo " the user is $user home folder is $homeFolder the uid is $uid"
done 

