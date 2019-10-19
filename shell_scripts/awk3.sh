#!/bin/bash

curl -s ipinfo.io | awk -F '"' '/postal/{print $(NF-1)}'