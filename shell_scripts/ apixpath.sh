#!/bin/bash

curl -sku username:password https://URL:8443/JSSResource/departments | xmllint --xpath "/departments/size" -