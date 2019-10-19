#!/bin/sh 
user=$(ls -l /dev/console | awk {' print $3 '}) 
cache="/Users/$user/Library/Caches/" 
killall App\ Store 
killall storeaccountd 
killall storeassetd 
killall storedownloadd 
killall storeinappd 
rm -rf $cache/storeaccountd 
rm -rf $cache/storeassetd 
rm -rf $cache/storedownloadd 
rm -rf $cache/storeinappd 
rm -rf /private/var/folders/* 
exit 0