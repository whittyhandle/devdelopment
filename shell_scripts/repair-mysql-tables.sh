#! /bin/sh 

# Created Lois Fredrickson 8-16-14
#
# Creates a file called /tmp/jamf.tables 
mysql -ujamfsoftware -pjamfsw03 jamfsoftware -e 'show tables;' | awk '{print $1 }' > /tmp/jamf.tables

count=0

#This loop checks the tables
while read table
   do
    count=$((count+1))
    echo "$count $table"
    #Checks table
    mysqlcheck -u jamfsoftware -pjamfsw03 jamfsoftware $table 
    #Repair table
    mysqlcheck -u jamfsoftware -pjamfsw03 --repair jamfsoftware $table 
    #Optimize table
    mysqlcheck -u jamfsoftware -pjamfsw03 --optimize jamfsoftware $table 
   done < /tmp/jamf.tables

rm /tmp/jamf.tables

exit 0
