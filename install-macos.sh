#!/bin/bash

zenity --question --width 300 --text "You will need to enter your password in the terminal." --ok-label "Install" --cancel-label "Cancel"

if [[ $? -eq 1 ]]
then

	# they pressed Cancel or closed the dialog window 
	zenity --error --title="Magic Gate" --width=200 \
			 --text="Installation aborted."
	exit 1

else 
	
	# Move folder
	sudo mkdir ~/Library/Application\ Support/MagicGate/
	cd
	sudo cp -r ~/magic-gate/ ~/Library/Application\ Support/MagicGate/
	rm -rf ~/magic-gate
	
	# Editing the .bashrc
	echo "alias magicgate='sh ~/Library/Application\ Support/MagicGate/magicgate.sh' " >> ~/.bashrc
	zenity --info --width 500 --text="Done. Type 'source ~/.bashrc' or open a new terminal window to use Magic Gate."
	
	# Cleaning up
	sudo mv ~/Library/Application\ Support/MagicGate/mgmac.sh ~/Library/Application\ Support/MagicGate/magicgate.sh
	sudo rm ~/Library/Application\ Support/MagicGate/mglinux.sh ~/Library/Application\ Support/MagicGate/install-linux.sh
	
fi