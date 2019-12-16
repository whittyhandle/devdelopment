#!/bin/bash

curl -sku username:password https://URL:8443/JSSResource/computers/id/3000 \
-X PUT \
-H "content-type: text/xml" \
-d "<computer>
      <location>
        <username>dave</username>
      </location>
  </computer>"