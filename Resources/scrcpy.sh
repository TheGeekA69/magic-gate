#!/bin/bash

# Presenting Scrcpy
zenity --text-info --filename=Resources/scrcpyhelp.txt --title "Magic Gate" --width 500 --height 360 --ok-label "Next" --cancel-label "Quit"

if [[ $? -eq 1 ]]; then

		exit 1

else


# Checking for known IP address
			file=ipaddress
			if test -f "$file"
			then
				sleep 0
			else
				Response=$(zenity --entry --text "What is your device's IP address?" --title "Scrcpy" --entry-text="")

				echo "phoneip=$Response:5555" >> ipaddress
			fi


adb kill-server

zenity --question --width 300 --text "Do you want to run Scrcpy over USB or WiFi?" --ok-label "WiFi" --cancel-label "USB"

if [[ $? == 0 ]]
	# Chose over WiFi
	then
	source ipaddress
	adb connect $phoneip	
	scrcpy -b 16M --window-borderless

else 	
	# Chose over USB
	scrcpy -b 16M --window-title "Scrcpy"
	exit 1

fi


fi