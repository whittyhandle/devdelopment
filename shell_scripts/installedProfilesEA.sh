#!/bin/bash

var=`profiles -P -v | awk -F: '/attribute: name:/{print $NF}' | sed 's/\ //' | grep ProfileName`

echo "<result>$var</result>"