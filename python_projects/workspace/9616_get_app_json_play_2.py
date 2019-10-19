#!/usr/bin/python

import requests 
import json
import time
import csv

results = []

t1 = time.perf_counter()

adam_id_csv = input("Drag and drop CSV: ").replace(" ", "")

with open(f"{adam_id_csv}", 'r', encoding='utf-8-sig') as _filehandler:
  csv_file_reader = csv.reader(_filehandler)
  adam_ids = []
  for row in csv_file_reader:
    adam_ids.append(row[0])
    


for adam_id in adam_ids:
  url = f"https://itunes.apple.com/lookup?id={adam_id}"
  # response output is a dict 
  response = requests.get(url, headers={"Accept": "application/json"}).json()
  r = requests.get(url)
  #  output app names and amount of time it took 
  time.sleep(r.elapsed.total_seconds())
  print(response['results'][0]['trackName'])
  print(f'{r.elapsed.total_seconds()} seconds')
  
 
t2 = time.perf_counter()
print(f"total time {t2-t1} in seconds")