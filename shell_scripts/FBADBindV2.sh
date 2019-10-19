#!/bin/bash


#Turn Off IPV6
networksetup -setv6off Ethernet

#Set Time Server
sudo ntpdate -u nyc03dc01.corp.local


# Standard parameters
computerid=`scutil --get LocalHostName`
domain="corp.local"               
udn="corp.bind@corp.local"               
password="Jn2dmn@13"                         
ou="OU=NYC03,OU=Firstborn,OU=Dentsu_Innovation_Interactive,DC=corp,DC=local"          
 
# Advanced options
alldomains="enable"
localhome="enable"
protocol="smb"
mobile="enable"
mobileconfirm="disable"
useuncpath="disable"
user_shell="/bin/bash"
preferred="corp.local"
admingroups="Corp\dn-glbl-SupportOpsOUdelegation"
namespace="corp.local"   
 

### End of configuration

# Activate the AD plugin
defaults write /Library/Preferences/DirectoryService/DirectoryService "Active Directory" "Active"
plutil -convert xml1 /Library/Preferences/DirectoryService/DirectoryService.plist 


sleep 5

 
# Bind to AD
dsconfigad -add -force -computer "$computerid" -domain "$domain" -username "$udn" -password "$password" -ou "$ou"

Sleep 60
 
# Configure advanced AD plugin options
if [ "$admingroups" = "Corp\dn-glblSupportOpsOUdelegation" ]; then
dsconfigad -nogroups
else
dsconfigad -groups "$admingroups"
fi
 
dsconfigad -alldomains $alldomains -localhome $localhome -protocol $protocol \
-mobile $mobile -mobileconfirm $mobileconfirm -useuncpath $useuncpath \
-shell $user_shell $preferred
 
dsconfigad -packetsign require                              
dsconfigad -packetencrypt require                    
dsconfigad -passinterval=0

# Restart DirectoryService (necessary to reload AD plugin activation settings)
killall DirectoryService
 
# Add the AD node to the search path
if [ "$alldomains" = "enable" ]; then
csp="/Active Directory/All Domains"
else
csp="/Active Directory/$domain"
fi
 
dscl /Search -create / SearchPolicy CSPSearchPath
dscl /Search -append / CSPSearchPath "/Active Directory/All Domains"
dscl /Search/Contacts -create / SearchPolicy CSPSearchPath
dscl /Search/Contacts -append / CSPSearchPath "/Active Directory/All Domains"
 
# This works in a pinch if the above code does not
defaults write /Library/Preferences/DirectoryService/SearchNodeConfig "Search Node Custom Path Array" -array "/Active Directory/All Domains"
defaults write /Library/Preferences/DirectoryService/SearchNodeConfig "Search Policy" -int 3
defaults write /Library/Preferences/DirectoryService/ContactsNodeConfig "Search Node Custom Path Array" -array "/Active Directory/All Domains"
defaults write /Library/Preferences/DirectoryService/ContactsNodeConfig "Search Policy" -int 3
 
plutil -convert xml1 /Library/Preferences/DirectoryService/SearchNodeConfig.plist
 