#!/bin/bash

#defaults write ~/Desktop/user.plist HomeFolder -array-add Desktop
#defaults write ~/Desktop/user.plist HomeFolder -array-add Music
#defaults write ~/Desktop/user.plist HomeFolder -array-add test
#adds things in order 

#for folder in ~/*;do 
#  defaults write ~/Desktop/user.plist HomeFolder -array-add "$folder"
#done

# array and for loop example  
  
#for folder in ~/*;do 
#  defaults write ~/Desktop/user.plist HomeFolder -array-add "$(basename $folder)"
#done
  
#basename returns just the name of the folder 
  
#defaults write ~/Desktop/userAttributes.plist Attributes -dict-add UniqueID 501
 
#for i in UniqueID NFSHomeDirectory UserShell;do 
#defaults write ~/Desktop/userAttributes.plist Attributes -dict-add $i "$(dscl . read /Users/test $1 | awk '{print $NF}')"
#done 


