#!/usr/bin/python
import requests
import csv


adam_id_csv = input("Drag and drop CSV: ")

def csv_input():
  '''read in a csv file and output adam id's as a list'''

  with open(f"{adam_id_csv}", 'r', encoding='utf-8-sig') as _filehandler:
    csv_file_reader = csv.reader(_filehandler)
    adam_ids = []
    for row in csv_file_reader:
      adam_ids.append(row[0])
    return adam_ids
 

def get_app_name(*args):
  ''' takes csv_input as a tuple and iterates through printing the app name'''
  # apple itunes api
  results = []
  for adam_id in args:
    url = f"https://itunes.apple.com/lookup?id={adam_id}"
  
    # response output is a dict 
    response = requests.get(url, headers={"Accept": "application/json"}).json()
    #  output app names 
  
    print(f"adam_id {adam_id} = {response['results'][0]['trackName']}")

    
get_app_name(*csv_input())

# error handle resultCount: 0 vs resultCount: 1 


 