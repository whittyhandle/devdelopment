#!/bin/bash

for app in /Applications/*.app;do
  
 echo "The version of $app is: $(defaults read "$app"/Contents/Info.plist CFBundleVersion)"
  
  
done 