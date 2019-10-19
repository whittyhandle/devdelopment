#!/bin/bash

epoch=$(sysctl kern.boottime | awk '{print $5}' | tr -d ,)
#echo $epoch

echo "<result>$(date -jf %s $epoch +%F\ %T)</result>"
 
