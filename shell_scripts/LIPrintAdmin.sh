#!/bin/sh
#set -xv; exec 1>>/tmp/out 2>&1
#The line above is used for logging and troubleshooting only - if you need to troubleshoot this script, remove the "#" from the line.  Once you are done, put the "#" back at the beginning of the line.
#This script will add the local user to the lpadmin group so that they can add printers without being a local admin (this started with 10.5.7)
# Updated on August 21, 2009 - All local users will be excluded

Local=`dscl . -read /Users/$3 |grep AppleMetaNodeLocation |awk '{print $1}'`
LocalUser=`dscl . -read /Users/$3 |grep OriginalNodeName |awk '{print $1}'`

if [[ "$LocalUser" == "" && "$Local" == "/Local/Default" ]]; then
exit 0
fi

node=`dscl localhost -list /LDAPv3 | awk '{print $2}'`
printadmin=`dseditgroup -o checkmember -n /LDAPv3/$node -m $3 printadmins | awk '{print $2}'`
online=`dscl localhost -read /LDAPv3/$node | grep NodePath | awk '{print $1}'`
# conline=`dscl localhost -read /LDAPv3/$node/ComputerLists/printadmins | grep dsAttrTypeNative:cn: | awk '{print $1}'`
name=`hostname | awk '{gsub(/.local/,"");print}'`
# computerprintadmin=`dscl localhost -read /LDAPv3/$node/ComputerLists/printadmins | grep Computers |grep $name | sed "s/.*\($name\)/\1/"`

# if [[ "$computerprintadmin" == "$name" ]]; then
# dseditgroup -o edit -a $3 -t $3 _lpadmin
# exit 0
# fi	
	
if [[ "$printadmin" == "yes" ]]; then
dseditgroup -o edit -a $3 -t $3 _lpadmin
exit 0
fi

if [[ "$printadmin" == "no" ]]; then
dseditgroup -o edit -d $3 -t $3 _lpadmin
exit 0
fi

logger -t lan.d65.printadmin "User $3 was added to lpadmin group."
