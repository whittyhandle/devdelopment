#!/bin/sh

## Standard Parameters
pathToScript=$0

## Global Script Parameters
backupPath="/Users/Shared/"
mysqlPath="/usr/local/mysql/bin/mysql"
mysqldumpPath="/usr/local/mysql/bin/mysqldump"
mysqlHost="localhost"
mysqlPort="3306"
mysqlDB="jamfsoftware"
mysqlUser="jamfsoftware"
mysqlPass="jamfsw03"

deleteBackupsOlderThanXDays="7"
logFile="/Library/JSS/Logs/backupDatabase.log"

# Functions
logEvent(){
	if [ ! -f "$logFile" ]; then
		mkdir -p "$(/usr/bin/dirname $logFile)"
	fi
	echo $1
	echo $(date "+%Y-%m-%d %H:%M:%S: ") $1 >> $logFile
}

repairTables(){
	#logEvent "Repairing tables before backup..."
	echo "Repairing tables before backup..."
	for table in `$mysqlPath -h $mysqlHost --port=$mysqlPort --user=$mysqlUser --password=$mysqlPass $mysqlDB -e 'show tables' | /usr/bin/sed 's/Tables_in_jamfsoftware//g'`
	do
		#logEvent "Repairing table: $table"
		echo "Repairing table: $table"
		"$mysqlPath" -h $mysqlHost --port=$mysqlPort --user=$mysqlUser --password=$mysqlPass $mysqlDB -e 'REPAIR TABLE '"$table"';' 2>&1 >/dev/null
	done
}

saveBackup(){
	formattedDate=`/bin/date '+%Y-%m-%d_%T' | /usr/bin/sed 's/:/-/g'`
	fileName="$formattedDate.sql.gz"

	#logEvent "Saving backup to $backupPath/$fileName..."
	echo "Saving backup to $backupPath/$fileName..."
	if [ ! -d "$backupPath" ]; then
		/bin/mkdir -p "$backupPath"
	fi
	
	"$mysqldumpPath" -h $mysqlHost --port=$mysqlPort --lock-tables=false --add-drop-table -c --user=$mysqlUser --password=$mysqlPass --max_allowed_packet=1G $mysqlDB | /usr/bin/gzip > "$backupPath/$fileName"
	status1=${PIPESTATUS[0]}
	status2=$?
	if [ $status1 == 0 -a $status2 == 0 ]; then
		#logEvent "Successfully created backup."
		echo "Successfully created backup."
		#notifyJSS $fileName true
	else
		#logEvent "There was an error creating the backup. Exit Codes: $status1 $status2"
		echo "There was an error creating the backup. Exit Codes: $status1 $status2"
		#notifyJSS $fileName false
		exit 1
	fi
}

notifyJSS(){
	fileName="$1"
	success="$2"
	fileSize=`/usr/bin/du -sh "$backupPath/$fileName" | /usr/bin/awk '{print $1}'`
	
	if [ "$success" == "true" ]; then
		logEvent "Notifying JSS of successful backup..."
		result=`/usr/bin/curl -s --connect-timeout 15 "http://127.0.0.1:9006/jssBackupNotify.cxml" -d "path=$backupPath/$fileName&size=$fileSize&backupOK=true" -X POST | grep "action logged"`
	else
		logEvent "Notifying JSS of unsuccessful backup..."
		result=`/usr/bin/curl -s --connect-timeout 15 "http://127.0.0.1:9006/jssBackupNotify.cxml" -d "path=$backupPath/$fileName&size=$fileSize&backupOK=false" -X POST | grep "action logged"`
	fi

	if [ "$result" != "" ]; then
		logEvent "Successfully notified the JSS of the backup."
	else
		logEvent "There was an error notifying the JSS of the backup." 
	fi
}

deleteOldBackups(){
	logEvent "Deleting backups older than 7 days..."
	/usr/bin/find "$backupPath" -name "*.sql.gz" -mtime +"$deleteBackupsOlderThanXDays" -type f -exec rm {} \;
}

# Main
#logEvent "######### Creating Database Backup #########"
repairTables
saveBackup
#deleteOldBackups
exit 0