#!/bin/bash

#/usr/libexec/PlistBuddy -h
#need full path -h for help 

#/usr/libexec/PlistBuddy -c "print " /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
#/usr/libexec/PlistBuddy -c "print Interfaces" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
#can look up a specif dict 
#/usr/libexec/PlistBuddy -c "print Interfaces:1" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
# -c I want to do a command 
#/usr/libexec/PlistBuddy -c "print Interfaces:1:BSD\ Name" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
#to search dictionary use colon
#/usr/libexec/PlistBuddy -c "print Interfaces:0:SCNetworkInterfaceInfo" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
# can call another dict from in the array 

#/usr/libexec/PlistBuddy -c "print Interfaces:0:SCNetworkInterfaceInfo:UserDefinedName" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
#/usr/libexec/PlistBuddy -c "print Interfaces" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist | grep -c "^Array"
#/usr/libexec/PlistBuddy -c "print Interfaces" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist | grep -c "^ *Dict"
#grep -c count ^ starts with | regular expression * mean these guys with me 

#count=$(/usr/libexec/PlistBuddy -c "print Interfaces" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist | grep -c "^ *Dict")
#until (( count == 0));do 
#  echo $count 
#  ((count -=1))
#  done 

#count=$(/usr/libexec/PlistBuddy -c "print Interfaces" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist | grep -c "^ *Dict")

#until (( count == 0));do 
#  ((count -=1))
#  echo $count 
 # >wrong  usr/libexec/PlistBuddy -c "print Interfaces:$count" /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist | grep -c "^ *Dict

#  done 

#/usr/libexec/PlistBuddy -c "set DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
#setting the value 

 