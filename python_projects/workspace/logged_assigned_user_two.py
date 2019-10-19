#!/usr/bin/python
import os
import json
import http.client
from getpass import getuser

def get_computer_id():
  return os.system("sudo jamf recon | grep computer_id | sed 's/<[^>]*>/ /g'")
  

def get_assigned_user(computer_id):
  conn = http.client.HTTPSConnection("jtest.jamfcloud.com")


  headers = {
  'authorization': "Basic dGVzdDp0ZXN0",
  'Accept': "application/json"

  }

  conn.request("GET", "/JSSResource/computers/id/{}".format(computer_id), headers=headers)


  res = conn.getresponse()
  data = res.read()
  data_dict = json.loads(data.decode("UTF-8"))
  return data_dict['computer']['location']['username']
  
print(get_assigned_user(get_computer_id()))

