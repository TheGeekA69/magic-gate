#!/bin/bash

source ~/.folderpath
# Splashscreen

	# Get text path
	text=".splashscreen.txt"
	current=`$path`
	path="$current$text"
	
zenity --text-info --filename=$path --title "Magic Gate" --width 600 --height 420 --ok-label "Next" --cancel-label "Quit"




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


if [[ $? -eq 1 ]]
	then
	# they pressed Cancel or closed the dialog window 
	zenity --error --title="Magic Gate" --width=200 \
			 --text="Magic Gate aborted."
	exit 1

elif [ $ListType == "Shell" ]
	then
	# they selected ADB Shell 
	sh `pwd`/Resources/shell.sh
	
elif [ $ListType == "Teleporter" ]
	then	
	# they selected ADB Teleporter
	sh `pwd`/Resources/teleporter.sh
	
elif [ $ListType == "Scrcpy" ]
	then	
	# they selected Scrcpy
	sh `pwd`/Resources/scrcpy.sh
	
else 
	# they pressed Cancel or closed the dialog window 
		zenity --error --title="Magic Gate" --width=200 \
				 --text="Magic Gate aborted."
		exit 1

fi


exit 0