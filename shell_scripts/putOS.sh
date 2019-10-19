#!/bin/bash

curl -sku admin:jamf1234 https://kittle.local:8443/JSSResource/mobiledevices/id/3000 \
-X PUT \
-H "content-type: text/xml" \
-d "<mobile_device>
      <location>
        <room>10.3.3</room>
      </location>
  </mobile_device>"