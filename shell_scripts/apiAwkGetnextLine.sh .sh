  #!/bin/bash


curl -sku username:password https://URL:8443/JSSResource/computers | xmllint --format - | awk -F "[<>]" '/<id>98/{getline;print $3}'
