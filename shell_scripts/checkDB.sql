--	This script is designed to identify data within the database that has been abandoned
--  Developed for version 9.1+ of the JSS

--	To execute this script from the command line run the following command:
--	/path/to/mysql -u jamfsoftware -pjamfsw03 jamfsoftware < /path/to/this/script.sql

--	To execute this script from MySQL command prompt run the following commands:
--	USE jamfsoftware
--	source /path/to/this/script.sql

--	If there are any Windows machines inventoried expect a few tables (hardware reports, 
--	extension attribute values, operating systems, etc.) to have small amounts of "abandoned" data.

select count(*) as abandoned_logs from log_actions where log_id not in (select log_id from logs);

select count(*) as JDS_files_waiting_for_download from downloadable_files;

select count(*) as abandoned_application_records from applications where report_id not in (select report_id from reports);

select count(*) as abandoned_extension_attribute_values from extension_attribute_values where report_id not in (select report_id from reports);

select count(*) as abandoned_font_records from fonts where report_id not in (select report_id from reports);

select count(*) as abandoned_hard_drive_partion_records from hard_drive_partitions where report_id not in (select report_id from reports);

select count(*) as abandoned_hard_drive_records from hard_drives where report_id not in (select report_id from reports);

select count(*) as abandoned_hardware_report_records from hardware_reports where report_id not in (select report_id from reports);

select count(*) as abandoned_mobile_device_detail_records from mobile_device_details where report_id not in (select report_id from reports);

select count(*) as abandoned_mobile_device_extension_attribute_value_records from mobile_device_extension_attribute_values where report_id not in (select report_id from reports);

select count(*) as abandoned_mobile_device_installed_application_records from mobile_device_installed_applications where report_id not in (select report_id from reports);

select count(*) as abandoned_mobile_device_installed_certificate_records from mobile_device_installed_certificates  where report_id not in (select report_id from reports);

select count(*) as abandoned_mobile_device_installed_profile_records from mobile_device_installed_profiles where report_id not in (select report_id from reports);

select count(*) as abandoned_mobile_device_installed_provisioning_profile_records from mobile_device_installed_provisioning_profiles where report_id not in (select report_id from reports);

select count(*) as abandoned_operating_system_records from operating_systems where report_id not in (select report_id from reports);

select count(*) as abandoned_plugin_records from plugins where report_id not in (select report_id from reports);