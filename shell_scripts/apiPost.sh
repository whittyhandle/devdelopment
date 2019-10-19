#!/bin/bash

curl -sku admin:jamf1234 https://kittle.local:8443/JSSResource/departments/id/0 -X POST \
-H "content-type: text/xml" \
-d "<department>
<name>Fall Serv</name>
</department>" 