#!/bin/bash

#!/bin/bash

curl -s ipinfo.io | awk '/postal/{print $(NF)}' | tr -d \"