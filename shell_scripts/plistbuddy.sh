#!/bin/bash

#/usr/libexec/PlistBuddy -c "print Battery\ Power:Standby\ Delay  " /Library/Preferences/com.apple.PowerManagement.12F285FE-959C-53C3-8F9D-9DBA30757402.plist

delay=$(/usr/libexec/PlistBuddy -c 'Print :ProgramArguments:3' /Library/LaunchDaemons/com.jamfsoftware.task.1.plist)
echo "<result>$delay</result>"