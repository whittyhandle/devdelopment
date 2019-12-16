#!/bin/bash

curl -sku username:password https://URl:8443/JSSResource/departments/id/0 -X POST \
-H "content-type: text/xml" \
-d "<department>
<name>Fall Serv</name>
</department>" 