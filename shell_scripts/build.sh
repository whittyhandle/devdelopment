#!/bin/sh

########## JSS Variables ##########
apiUser=""
apiPass=""
url="" # Full JSS URL including port ex. https://jamit.q.jamfsw.corp:8443

########### File Path Variables ############
csvFile="/tmp/users.csv"
xmlFile="/tmp/users.xml"
xmlPath="/tmp/userGroup.xml"
masterCSV="/tmp/masterCSV.csv"

########## API PUT Variables ##########
staticUserGroupName=""

########## GET Full User List From JSS ##########

if [ ! -f $masterCSV ]; then

	curl -sk -u $apiUser:$apiPass $url/JSSResource/users | xmllint --format - --xpath /name > $xmlFile
	grep 'name' $xmlFile | cut -f2 -d">" | cut -f1 -d"<" > $masterCSV
fi

# Create CSV File
cat $masterCSV | head -n 100 > $csvFile

count=`cat $csvFile | awk -F, '{print $1}'`

IFS=$'\n'
for i in ${count}
do
cat <<EndXml > $xmlPath
<?xml version="1.0" encoding="UTF-8"?>
<user_group>
	<user_additions>
		<user>
			<username>$i</username>
		</user>
	</user_additions>
</user_group>
EndXml

curl -sk -u $apiUser:$apiPass $url/JSSResource/usergroups/name/$staticUserGroupName -T $xmlPath -X PUT
done