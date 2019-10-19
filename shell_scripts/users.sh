#!/bin/bash

array=($(dscl . list /Users))
array+=(hadmin)


for i in ${array[@]};do
  echo "I found $i "
  [[ "$i" == "_www" ]] && break 
  echo "moving on"
  
done