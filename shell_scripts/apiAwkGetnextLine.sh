  #!/bin/bash


curl -sku admin:jamf1234 https://kittle.local:8443/JSSResource/computers | xmllint --format - | awk -F "[<>]" '/<id>98/{getline;print $3}'