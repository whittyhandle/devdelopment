#!/bin/bash

curl -sku admin:jamf1234 https://ssw-93b.quick.jamfsw.corp:8443/JSSResource/mobiledevices/id/13 |  xmllint --xpath "//os_version" - 