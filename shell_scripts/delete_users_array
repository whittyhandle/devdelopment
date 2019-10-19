#!/bin/bash
username= 
password=
jssurl=

getUsers=$(curl -sku $username:$password $jssurl/JSSResource/users -H "accept: application/xml" | xmllint --xpath "/users/user/id" - | sed 's/<[^>]*>/ /g')

IFS=' ' read -r -a array <<< "$getUsers" 

for i in ${getUsers[@]};do
  curl -sku $username:$password $jssurl/JSSResource/users/id/$i -X DELETE
done

