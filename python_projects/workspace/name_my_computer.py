#!/usr/bin/python

import os

c_name = input("what name computer do: ")
def name_computer(c_name):
  try:
    #os.system(f"scutil --set HostName {c_name}")
    print(c_name)
  except:
    pass
  try:
    pass
    #os.system(f"scutil --set LocalHostName {c_name}")
  except: 
    pass
  try:
    pass
    #os.sytem(f"scutil --set ComputerName {c_name}")
  except:
    pass

name_computer(c_name)

