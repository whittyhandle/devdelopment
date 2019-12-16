#!/bin/bash
username=""
password=""
hash=YWRtaW46amFtZjEyMzQ=
jssurl=https://overlord.support.jamf.net:8443
echo hash=$(printf " ${username}:${password}" | iconv -t ISO-8859-1 | base64 -i -)

getusers=$(curl -k -X GET $jssurl/JSSResource/users --header "authorization: Basic ${hash}" | xmllint --xpath "/users/user/id" - | sed 's/<[^>]*>/ /g')

IFS=' ' read -r -a array <<< "$getusers" 

for i in ${getusers[@]};do
  echo $i
  #curl -sku $username:$password -H "Content-type: text/xml" -X POST <jamfPro_url>/JSSResource/buildings/id/16 -X DELET
done
