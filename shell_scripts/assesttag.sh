#!/bin/bash

#osascript -e 'text returned of (display dialog "qwerty" default answer "xx0099" buttons {"ok", "cancel"} default button 1
#copy the result as list to {text_returned, button_pressed})'

assteTag=$(osascript <<EOF

text returned of (display dialog "qwerty" default answer "xx0099" buttons {"ok", "cancel"} default button 1
copy the result as list to {text_returned, button_pressed})
EOF)

sudo jamf recon -assetTag $assetTag