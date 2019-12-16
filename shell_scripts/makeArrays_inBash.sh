#one method to make an array 
apps+=(`curl -H "accept: application/xml" -sku admin:jamf1234 https://jtest.jamfcloud.com/JSSResource/computers | xmllint --xpath "/computers/computer/id" - | sed 's/<[^>]*>/ /g'`)
echo ${apps[0]} 

#vs using ifs 

getUsers=$(curl -sku -H "accept: application/xml" test:test https://url:8443/JSSResource/users | xmllint --xpath "/users/user/name" - | sed 's/<[^>]*>/ /g' )

#IFS defines your delimiter, so you want a whitespace in between those quotes
#or, you could change the sed to add a comma instead and then use "IFS=","
#either way, IFS defines your delimiter, and then read takes in your variable and appends the values into the array

IFS=' ' read -r -a array <<< "$getUsers". 
echo ${array[0]}
echo ${array[1]}
echo ${array[2]}

for i in ${array[@]};do
	echo $i
done
