#!/bin/bash



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

zenity --question --width 300 --text "Do you want to run Teleporter over USB or WiFi?" --ok-label "WiFi" --cancel-label "USB"

if [[ $? == 0 ]]
	# Chose over WiFi
	then
	source ipaddress
	adb connect $phoneip
	
	# Prompting for file type
	ListType=`zenity --width=400 --height=275 --list --radiolist \
				 --title 'Magic Gate' \
				 --text 'What kind of media do you want to send?' \
				 --column 'Select' \
				 --column 'Type' FALSE "Music" FALSE "Photos-Videos" FALSE "Other"\
				 --ok-label "Next"\
				 --cancel-label "Quit"`	
				
	# Sending over the choice

	if [[ $? -eq 1 ]]
		then
		# they pressed Cancel or closed the dialog window 
		zenity --error --title="Magic Gate" --width=200 \
				 --text="Teleporter aborted."
		exit 1

	elif [ $ListType == "Music" ]
		then
		# they selected Music
		
		music=$(zenity --file-selection --multiple --separator=" " --file-filter="*.mp3 *.aac *.m4a *.flac")
		adb	push $music /storage/self/primary/Music/
		zenity --info --title "Teleporter" --text "Transfer complete" --width 200
			
	elif [ $ListType == "Photos-Videos" ]
		then	
		# they selected Photos or Videos
		
		photo=$(zenity --file-selection --multiple --separator=" " --file-filter="*.png *.jpg *.dng *.mp4 *.avi *.mov")
		adb push $photo /storage/self/primary/DCIM/Camera/
		zenity --info --title "Teleporter" --text "Transfer complete" --width 200
		
	elif [ $ListType == "Other" ]
		then	
		# they selected Other
		
		file=$(zenity --file-selection --separator=" " --multiple)
		adb push $file /storage/self/primary/Documents/
		zenity --info --title "Teleporter" --text "Transfer complete" --width 200
		
	else 
		# they pressed Cancel or closed the dialog window 
			zenity --error --title="Magic Gate" --width=200 \
					 --text="Magic Gate aborted."
			exit 1

	fi

	
else 	
	# Chose over USB
	
	# Prompting for file type
		ListType=`zenity --width=400 --height=275 --list --radiolist \
					 --title 'Magic Gate' \
					 --text 'What kind of media do you want to send?' \
					 --column 'Select' \
					 --column 'Type' FALSE "Music" FALSE "Photos-Videos" FALSE "Other"\
					 --ok-label "Next"\
					 --cancel-label "Quit"`	
					
		# Sending over the choice

		if [[ $? -eq 1 ]]
			then
			# they pressed Cancel or closed the dialog window 
			zenity --error --title="Magic Gate" --width=200 \
					 --text="Teleporter aborted."
			exit 1

		elif [ $ListType == "Music" ]
			then
			# they selected Music
			
			music=$(zenity --file-selection --multiple --separator=" " --file-filter="*.mp3 *.aac *.m4a *.flac")
			adb	push $music /storage/self/primary/Music/
			zenity --info --title "Teleporter" --text "Transfer complete" --width 200
			
				
		elif [ $ListType == "Photos-Videos" ]
			then	
			# they selected Photos or Videos
			
			photo=$(zenity --file-selection --multiple --separator=" " --file-filter="*.png *.jpg *.dng *.mp4 *.avi *.mov")
			adb push $photo /storage/self/primary/DCIM/Camera/
			zenity --info --title "Teleporter" --text "Transfer complete" --width 200
			
		elif [ $ListType == "Other" ]
			then	
			# they selected Other
			
			file=$(zenity --file-selection --separator=" " --multiple)
			adb push $file /storage/self/primary/Documents/test/			
			zenity --info --title "Teleporter" --text "Transfer complete" --width 200
			
		else 
			# they pressed Cancel or closed the dialog window 
				zenity --error --title="Magic Gate" --width=200 \
						 --text="Magic Gate aborted."
				exit 1

		fi

	
	exit 1

fi

