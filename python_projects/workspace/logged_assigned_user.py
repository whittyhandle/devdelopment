import os
import requests
import subprocess
from getpass import getuser
from base64 import b64encode



def get_computer_id():
  #return os.system("sudo jamf recon | grep computer_id | sed 's/<[^>]*>/ /g'")
  return 30


def get_computers_by_id(computer_number):

  url = f"https://url.jamfcloud.com/JSSResource/computers/id/{computer_number}"

  #response = requests.get(url, headers={"Accept": "application/json"}, auth=('username', 'password')).json()
  r = requests.get(url, headers={"Accept": "application/json", "Authorization": "Basic %s" % 'dGVzdDp0ZXN0'}).json()

  #print(response['computer']['location']['username'])
  #print(r)
  return r['computer']['location']['username']

print(get_computers_by_id(get_computer_id()))
print(getuser())
