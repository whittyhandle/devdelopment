#!/bin/sh

source logger.sh

unset detectedOS
logEventNoNewLine "Checking for a supported OS..."

if [ -f "/usr/bin/lsb_release" ]; then

ubuntuVersion=`lsb_release -s -d`

case $ubuntuVersion in
*"Ubuntu 12.04"*)
detectedOS="Ubuntu"
export detectedOS
;;
*"Ubuntu 10.04"*)
detectedOS="Ubuntu"
export detectedOS
;;
esac

detectedOS="RedHat"
export detectedOS

if [ "${detectedOS}" != 'Ubuntu' ] && [ "${detectedOS}" != 'RedHat' ] && [ "${detectedOS}" != 'CentOS' ]; then
	logEvent "Error: Did not detect a valid Ubuntu/RedHat/Cent OS install."
	failedAnyChecks=1
fi