#!/bin/bash

#dscl . -readpl /Users/$admin accountPolicyData failedLoginCount
#admin=$(dscl . read /Groups/admin GroupMembership | cut -c 18-)
#echo $admin
var=0
for i in $(dscl . read /Groups/admin GroupMembership | cut -c 18-); do 
  count=$(dscl . -readpl /Users/$i accountPolicyData failedLoginCount | awk '/failedLoginCount/{print $NF}')
  #[[ $count -ge "1" ]] && 
  (( var += count))
  
done 
  
  echo "<result>$var</result>"