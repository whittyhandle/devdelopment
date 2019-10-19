#!/usr/bin/python
import requests
from requests.auth import HTTPBasicAuth
import base64
import getpass

jamfProUrl = input("enter you Jamf Pro host name: ")
username = input("Enter Jamf Server username: ")
password = input("Enter Jamf Server password:")


url = f"https://{jamfProUrl}/JSSResource/classes"

r = requests.get(url, auth=HTTPBasicAuth('username', 'password'))
print(r)

#r = requests.get(url, headers={"Accept": "application/json", "Authorization": "Basic %s" % 'dGVzdDp0ZXN0'}).json()
#print(r)


#for i in r['classes']:
#  class_id = i['id']
#  url2 = f"https://url.jamfcloud.com/JSSResource/classes/id/{class_id}"
#  r2 = requests.get(url2, headers={"Accept": "application/json", "Authorization": "Basic %s" % 'dGVzdDp0ZXN0'}).json()
#  id_num = r2["class"]["id"]
#  url3 = f"https://url.jamfcloud.com/JSSResource/classes/id/{id_num}"
#  r3 = requests.delete(url3, headers={"Authorization": "Basic %s" % 'dGVzdDp0ZXN0'})


 
  