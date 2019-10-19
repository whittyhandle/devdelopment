#!/bin/bash

curl -sku admin:jamf1234 https://kittle.local:8443/JSSResource/computers/id/3000 \
-X PUT \
-H "content-type: text/xml" \
-d "<computer>
      <location>
        <username>dave</username>
      </location>
  </computer>"