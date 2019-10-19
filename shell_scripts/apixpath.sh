#!/bin/bash

curl -sku admin:jamf1234 https://kittle.local:8443/JSSResource/departments | xmllint --xpath "/departments/size" -