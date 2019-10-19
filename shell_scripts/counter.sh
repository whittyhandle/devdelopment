#!/bin/bash

counter=0

while (( $counter <10));do 
  echo "the counter is $counter"
  (( counter+=1 )) 
done
