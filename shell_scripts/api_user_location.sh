#!/bin/sh

## Change these 3 variables to match your setup. API account must have API write privs
apiUser="test"
apiPass="test"
jssURL="https://URL:8443"

## get this Mac's MAC address
MAC=$( networksetup -getmacaddress en0 | awk '{print $3}' | sed 's/:/./g' )

## Create the xml for upload via API
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>
<computer>
	<location>
		<username/>
		<real_name/>
		<email_address/>
		<position/>
		<phone/>
		<department/>
		<building/>
		<room/>
	</location>
</computer>" > "/tmp/blank_location.xml"

## Now upload the xml file
curl -sku "${apiUser}:${apiPass}" "${jssURL}/JSSResource/computers/macaddress/$MAC" -T /tmp/blank_location.xml -X PUT
