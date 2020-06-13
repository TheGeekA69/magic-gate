#!/bin/bash

# Checking for known IP address
				file=~/ipaddress
				if test -f "$file"
				then
					sleep 0
				else
					Response=$(zenity --entry --text "What is your device's IP address?" --title "Scrcpy" --entry-text="")

					echo "phoneip=$Response:5555" >> ~/ipaddress
				fi


adb kill-server

zenity --question --width 300 --text "Do you want to run Shell over USB or WiFi?" --ok-label "WiFi" --cancel-label "USB"

if [[ $? == 0 ]]
	# Chose over WiFi
	then
	source ~/ipaddress
	adb connect $phoneip
	

	zenity --question --width 300 --text "What interface do you want to use?" --ok-label "CLI" --cancel-label "GUI"

	# 0 = CLI and 1 = GUI
	if [[ $? == 0 ]]
		then
		# CLI	
		adb shell

	else
		# GUI
		command=$(zenity --entry --text "Type your command without 'adb shell' below")
		stdout=$(adb shell $command)
		echo $stdout >> stdout
		zenity --text-info --editable --filename="stdout"


		while true
		do 	
			zenity --question --width 300 --text "Do you want to enter another command?"

			if [[ $? -eq 1 ]]; then
					rm stdout
					exit 1

			else
				# Entering the command
				command=$(zenity --entry --text "Type your command without 'adb shell' below")
				
				# Printing the result	
				stdout=$(adb shell $command)
				echo $stdout >> stdout
				zenity --text-info --editable --filename="stdout"
			fi

		done

	fi

else 	
	# Chose over USB
	zenity --question --width 300 --text "What interface do you want to use?" --ok-label "CLI" --cancel-label "GUI"

		# 0 = CLI and 1 = GUI
		if [[ $? == 0 ]]
			then
			# CLI	
			adb shell

		else
			# GUI
			command=$(zenity --entry --text "Type your command without 'adb shell' below")
			stdout=$(adb shell $command)
			echo $stdout >> stdout
			zenity --text-info --editable --filename="stdout"


			while true
			do 	
				zenity --question --width 300 --text "Do you want to enter another command?"

				if [[ $? -eq 1 ]]; then
						rm stdout
						exit 1

				else
					# Entering the command
					command=$(zenity --entry --text "Type your command without 'adb shell' below")
					
					# Printing the result	
					stdout=$(adb shell $command)
					echo $stdout >> stdout
					zenity --text-info --editable --filename="stdout"
				fi

			done

		fi
		
	fi
