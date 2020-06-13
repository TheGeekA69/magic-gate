#!/bin/bash


# Splashscreen
zenity --text-info --filename=".splashscreen.txt" --title "Magic Gate" --width 600 --height 420 --ok-label "Next" --cancel-label "Quit"




# Launcher GUI

if [[ $? -eq 1 ]]; then

	# they pressed Cancel or closed the dialog window 
	zenity --error --title="Magic Gate" --width=200 \
			 --text="Magic Gate aborted."
	exit 1

else 
	ListType=`zenity --width=400 --height=275 --list --radiolist \
			 --title 'Magic Gate' \
			 --text 'Select the ADB module you want to use:' \
			 --column 'Select' \
			 --column 'Module' FALSE "Shell" FALSE "Teleporter" FALSE "Scrcpy"\
			 --ok-label "Next"\
			 --cancel-label "Quit"`

fi


# Script launcher
pwd

if [[ $? -eq 1 ]]
	then
	# they pressed Cancel or closed the dialog window 
	zenity --error --title="Magic Gate" --width=200 \
			 --text="Magic Gate aborted."
	exit 1

elif [ $ListType == "Shell" ]
	then
	# they selected ADB Shell 
	sh ~/Library/Application\ Support/MagicGate/Resources/shell.sh
	
elif [ $ListType == "Teleporter" ]
	then	
	# they selected ADB Teleporter
	sh ~/Library/Application\ Support/MagicGate/Resources/teleporter.sh
	
elif [ $ListType == "Scrcpy" ]
	then	
	# they selected Scrcpy
	sh ~/Library/Application\ Support/MagicGate/Resources/scrcpy.sh
	
else 
	# they pressed Cancel or closed the dialog window 
		zenity --error --title="Magic Gate" --width=200 \
				 --text="Magic Gate aborted."
		exit 1

fi


exit 0