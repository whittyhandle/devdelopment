#!/usr/bin/python

import requests

response = requests.get('https://jamfsoftware.atlassian.net/wiki/rest/api/content/', headers={'user': 'QA8D4bPvz7oD9MLm4UgJCC32 '}).json()

print(response)


