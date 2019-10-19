#!/bin/sh

#All glory and honor to TJ Bauer
#variables to modify 

read -p "Database address:" dbAddy
read -p "Username:" jamfadmin
read -p "Instance:" database
echo ""
read -s -p "User password:" password
dbAddy=$ipaddressgoeshere

# RUN SQL QUERIES AND OUTPUT TO FILE

output="/tmp/can23.txt"
echo "$database - $dbAddy"
echo "" > $output
echo "* pushed out in the last hour" >> $output
echo "select command, profile_id, count(*) from mobile_device_management_commands where push_sent_epoch>unix_timestamp(date_sub(now(), interval 1 hour))*1000 group by profile_id, command order by count(*) desc limit 5;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy  -u $username -p$password $database -e "select command, profile_id, count(*) from mobile_device_management_commands where push_sent_epoch>unix_timestamp(date_sub(now(), interval 1 hour))*1000 group by profile_id, command order by count(*) desc limit 5;")

if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output
echo "* Check whether or not the commands are completing">> $output
echo "" >> $output
echo "select command, profile_id, count(*) from mobile_device_management_commands where date_completed_epoch>unix_timestamp(date_sub(now(), interval 1 hour))*1000 and apns_result_status!='' group by profile_id, command order by count(*) desc limit 5;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select command, profile_id, count(*) from mobile_device_management_commands where date_completed_epoch>unix_timestamp(date_sub(now(), interval 1 hour))*1000 and apns_result_status!='' group by profile_id, command order by count(*) desc limit 5;" )
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output
echo "* To check on progress of 'thundering herd' you can get a summary of what has pushed, created, completed, and pending in the last x amount of min, hours, or days. Example below is set for last 3 hours." >> $output
echo "" >> $output
echo "set @hour=3; select SUM(case when push_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as 'Pushes last @hour', SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as 'Sent in last @hour', SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 and apns_result_status= 'Acknowledged' then 1 else 0 end) as 'Completed last @hour',SUM(case when apns_result_status='' then 1 else 0 end) as 'Total Pending' ,SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 and date_completed_epoch='' then 1 else 0 end) as 'Command left from sent in @hour' from mobile_device_management_commands;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "set @hour=3; select SUM(case when push_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as 'Pushes last @hour', SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as 'Sent in last @hour', SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 and apns_result_status= 'Acknowledged' then 1 else 0 end) as 'Completed last @hour',SUM(case when apns_result_status='' then 1 else 0 end) as 'Total Pending' ,SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 and date_completed_epoch='' then 1 else 0 end) as 'Command left from sent in @hour' from mobile_device_management_commands;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output
echo "* To get a more granular look at commands/profile_ids" >> $output
echo "" >> $output
echo "set @hour=3; select command, profile_id, SUM(case when push_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as push, SUM(case when date_completed_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 and apns_result_status='Acknowledged' then 1 else 0 end) as Completed, SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as Sent from mobile_device_management_commands group by profile_id, command order by push desc limit 10;">> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "set @hour=3; select command, profile_id, SUM(case when push_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as push, SUM(case when date_completed_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 and apns_result_status='Acknowledged' then 1 else 0 end) as Completed, SUM(case when date_sent_epoch>unix_timestamp(date_sub(now(), interval @hour hour))*1000 then 1 else 0 end) as Sent from mobile_device_management_commands group by profile_id, command order by push desc limit 10;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output

echo "* Check for Auto Update for Apps" >> $output
echo "" >> $output
echo "select * from app_updater_settings; select * from mobile_device_management_ios_app_settings; select mobile_device_app_id,app_name, itunes_sync_time from mobile_device_apps where keep_description_and_icon_up_to_date=1 and deleted=0;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select * from app_updater_settings; select * from mobile_device_management_ios_app_settings; select mobile_device_app_id,app_name, itunes_sync_time from mobile_device_apps where keep_description_and_icon_up_to_date=1 and deleted=0;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output

echo "* PI-004429 - Devices with No Disk Space Free Result in \"InstallApplication\" Command Loop" >> $output
echo "" >> $output
echo "SELECT device_id, mobile_device_id, disk_size_mb, disk_available_mb, disk_percent_full FROM mobile_devices_denormalized where disk_percent_full > '90' and disk_available_mb < '100' order by disk_percent_full desc, disk_available_mb asc;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "SELECT device_id, mobile_device_id, disk_size_mb, disk_available_mb, disk_percent_full FROM mobile_devices_denormalized where disk_percent_full > '90' and disk_available_mb < '100' order by disk_percent_full desc, disk_available_mb asc;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output
echo "* Also you can run this other query for PI-004429" >> $output
echo "select count(*), device_id, command from mobile_device_management_commands where apns_result_status='' and device_id in (select mobile_device_id from mobile_devices_denormalized where disk_percent_full > 90) group by command;" >> output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select count(*), device_id, command from mobile_device_management_commands where apns_result_status='' and device_id in (select mobile_device_id from mobile_devices_denormalized where disk_percent_full > 90) group by command;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-004362 - Manually entering Roster data with ASM information falsely reports user syncing and creates duplicate user" >> $output
echo "" >> $output
echo "select count(*) from roster_user where roster_source='MDM';" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select count(*) from roster_user where roster_source='MDM';")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output
echo "* This query should be empty. If positive results are found, identify the offended users with following statement:" >> $output
echo "select * from roster_user where roster_source='MDM'\G" >> $output

echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select * from roster_user where roster_source='MDM'\G")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "* PI-004298 - SUSHELP-497 - ProfileList commands spamming iOS devices when peek-a-boo enabled, [...] " >> $output
echo "" >> $output
echo "select command, profile_id, count(*) from mobile_device_management_commands where date_completed_epoch>unix_timestamp(date_sub(now(), interval 1 hour))*1000 group by profile_id, command order by count(*) desc limit 5;" >> $output
echo "---------------------------------------------------" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select command, profile_id, count(*) from mobile_device_management_commands where date_completed_epoch>unix_timestamp(date_sub(now(), interval 1 hour))*1000 group by profile_id, command order by count(*) desc limit 5;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output


echo "* PI-003960 - SUS-4852 - Check for pending \"InstallApplication\" commands for scoped apps after inventory update and MDM installs or updates can cause MySQL bottleneck" >> $output
echo "" >> $output
echo "SELECT count(*) FROM mobile_device_management_commands WHERE (apns_result_status='' OR apns_result_status='Error' OR apns_result_status='NotNow') AND command in('InstallApplication','RemoveApplication') order by count(*);" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "SELECT count(*) FROM mobile_device_management_commands WHERE (apns_result_status='' OR apns_result_status='Error' OR apns_result_status='NotNow') AND command in('InstallApplication','RemoveApplication') order by count(*);")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output
echo "* PI-003408 - Duplicate Bundle ID for iOS inventory causing mobile_devices_installed_applications table to be written to potentially thousands of times." >> $output
echo "" >> $output
echo "select count(*),report_id from mobile_device_installed_applications group by report_id order by count(*) desc limit 10;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select count(*),report_id from mobile_device_installed_applications group by report_id order by count(*) desc limit 10;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-003321 - os_x_installed_configuration_profiles table may contain duplicate entries" >> $output
echo "" >> $output
echo "select count(*), computer_id, username, os_x_configuration_profile_id, last_install_epoch, is_removable from os_x_installed_configuration_profiles group by computer_id, username, os_x_configuration_profile_id, last_install_epoch, is_removable having count(*) > 1 order by count(*) desc;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select count(*), computer_id, username, os_x_configuration_profile_id, last_install_epoch, is_removable from os_x_installed_configuration_profiles group by computer_id, username, os_x_configuration_profile_id, last_install_epoch, is_removable having count(*) > 1 order by count(*) desc;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-002844 - Sending VPP Invitation with App Store restrictions, causes Profile List commands to push out every ~10 seconds to all devices in scope" >> $output
echo "" >> $output
echo "select * from mobile_device_management_commands WHERE command='InviteToProgram' AND apns_result_status!="Acknowledged";" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select * from mobile_device_management_commands WHERE command='InviteToProgram' AND apns_result_status!='Acknowledged';")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-004339 - Importing users via ASM can cause duplicates, which will stop enrollment and inventory updates" >> $output
echo "" >> $output
echo "select username from user_object group by username having count(*)>1\G" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select username from user_object group by username having count(*)>1\G")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-002801 - Warning in JAMFSoftwareServer.log: UserPushToken 'A required field (UDID, APN Token) was empty' may prevent... " >> $output
echo "" >> $output
echo "select distinct computer_id from computer_user_pushtokens where user_short_name='' or apn_token='' or push_magic='';" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select distinct computer_id from computer_user_pushtokens where user_short_name='' or apn_token='' or push_magic='';")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-003960, PI-003783, PI-003112, PI-005048 " >> $output
echo "" >> $output
echo "select mobile_device_app_id, app_name from mobile_device_apps where keep_description_and_icon_up_to_date=1 and deleted=0;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select mobile_device_app_id, app_name from mobile_device_apps where keep_description_and_icon_up_to_date=1 and deleted=0;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-003112, PI-004841, PI-004429 " >> $output
echo "" >> $output
echo "select device_id,device_object_id,profile_id,command,count(*) from mobile_device_management_commands where command="InstallApplication" and date_completed_epoch>unix_timestamp(date_sub(now(), interval 24 hour))*1000 group by device_id,device_object_id,profile_id,command order by 5 desc limit 50;
" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select device_id,device_object_id,profile_id,command,count(*) from mobile_device_management_commands where command="InstallApplication" and date_completed_epoch>unix_timestamp(date_sub(now(), interval 24 hour))*1000 group by device_id,device_object_id,profile_id,command order by 5 desc limit 50;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-002844, PI-004298, PI-003112, PI-004841, PI-004429 " >> $output
echo "" >> $output
echo "select device_id,device_object_id,profile_id,command,count(*) from mobile_device_management_commands where command="ProfileList" and date_completed_epoch>unix_timestamp(date_sub(now(), interval 24 hour))*1000 group by device_id,device_object_id,profile_id,command order by 5 desc limit 50;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select device_id,device_object_id,profile_id,command,count(*) from mobile_device_management_commands where command="ProfileList" and date_completed_epoch>unix_timestamp(date_sub(now(), interval 24 hour))*1000 group by device_id,device_object_id,profile_id,command order by 5 desc limit 50;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-004809 " >> $output
echo "" >> $output
echo "select b.model, a.device_id, count(*) from mobile_device_management_commands as a, mobile_devices_denormalized as b where apns_result_status="Error" and a.device_id = b.mobile_device_id group by 2 having count(*) > 10 order by 2 desc;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select b.model, a.device_id, count(*) from mobile_device_management_commands as a, mobile_devices_denormalized as b where apns_result_status="Error" and a.device_id = b.mobile_device_id group by 2 having count(*) > 10 order by 2 desc;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi

echo "" >> $output
echo "" >> $output
echo "* PI-002379 " >> $output
echo "" >> $output
echo "select count(*), command from mobile_device_management_commands where apns_result_status='' group by command;" >> $output
echo "---------------------------------------------------" >> $output
query=$(mysql -h $dbAddy -u $username -p$password $database -e "select count(*), command from mobile_device_management_commands where apns_result_status='' group by command;")
if [[ $query == "" ]]; then
echo "" >> $output
echo "Empty Set" >> $output
else
echo "$query" >> $output
fi


echo "" >> $output
echo "" >> $output

