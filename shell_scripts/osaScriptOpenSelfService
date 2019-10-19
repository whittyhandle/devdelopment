buttonReturn=$(osascript << EOF 
tell application "System Events" 
activate 
button returned of (display dialog "The Chrome version you are running is out-of-date. To update please visit the Self Service application by pressing Continue and select *Update my Google Chrome*" buttons {"Not Now", "Continue"} default button 2 with icon caution) 
end tell 
EOF) 
[[ $buttonReturn == "Continue" ]] && open -a "/Applications/Self Service.app" 
