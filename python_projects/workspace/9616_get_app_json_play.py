#!/usr/bin/python

import requests 
import json
import time
import csv


adam_ids = 934027127
#adam_ids = 509978837
results = []
# put t1 before the for loop 
t1 = time.perf_counter()

package_url = f'https://itunes.apple.com/lookup?id={adam_ids}'
r = requests.get(package_url)
package_json = r.json()
app_name = package_json['results'][0]['trackName']
#print(app_name)

data = {
  
  'adam_id': adam_ids, 
  'app_name': app_name
}
#print(data)
# results.append(data)

# goes in the for loop 
time.sleep(r.elapsed.total_seconds())
print(f'{r.elapsed.total_seconds()} seconds')

#t2 goes after the for loop 
t2 = time.perf_counter()
#print(f"time {t2-t1} seconds")

package_str = json.dumps(package_json, indent = 2)
#print(package_str)
#print(package_name)
#print(package_json)
#
# data = {
#    'App Name': response, 
#    'App Url': url
#  }
#  results.append(data)

# error handle resultCount: 0 vs resultCount: 1 