# This code sample uses the 'requests' library:
# http://docs.python-requests.org
import requests
from requests.auth import HTTPBasicAuth
import json

#https://developer.atlassian.com/cloud/confluence/basic-auth-for-rest-apis/
#https://developer.atlassian.com/server/confluence/advanced-searching-using-cql/
#https://developer.atlassian.com/cloud/confluence/rest/#api-content-get
#https://jamfsoftware.atlassian.net/wiki/rest/api/content/search?cql=text+~+Tomcat

url = "https://jamfsoftware.atlassian.net/wiki/rest/api/content"

auth = HTTPBasicAuth("zach.brommer@jamf.com", "QA8D4bPvz7oD9MLm4UgJCC32")

headers = {"Accept": "application/json"}

response = requests.request("GET", url, headers=headers, auth=auth)

print(
	json.dumps(
		json.loads(response.text), sort_keys=True, indent=4, separators=(",", ": ")))

