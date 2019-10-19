#!/bin/sh
ad_computer_name=`dsconfigad -show | grep "Computer Account" | awk '{print $4}'`
ad_computer_ou=`dscl localhost -read /Active\ Directory/AD/All\ Domains/Computers/$ad_computer_name | grep distinguished | awk '{print $2}'`

echo "<result>$ad_computer_ou</result>"
