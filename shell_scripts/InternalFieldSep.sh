#!/bin/bash
IFS=, 
while read id name serialnumber model; do 
  echo "the serial number for $id is $serialnumber. The name is $name for $model"
  done  < ~/Desktop/devices.csv