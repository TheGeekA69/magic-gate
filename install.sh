#!/bin/bash

# Prompting for Unix version
zenity --question --width 300 --text "Are you runnix Linux or macOS? You will need to enter your password in the terminal." --ok-label "Linux" --cancel-label "macOS"

if [[ $? == 0 ]]
	# Linux
then 	
	# Move folder 
	sudo mkdir /opt/magic-gate
	cd
	sudo cp -r magic-gate/ /opt/magic-gate/
	rm -rf magic-gate

	# Editing the .bashrc
	echo "alias magicgate='sh /opt/magic-gate/magicgate.sh' " >> ~/.bashrc
	zenity --info --text="Done. Type 'source ~/.bashrc' or open a new terminal window to use Magic Gate."
	
	# Renaming the launcher and deleting the other one
	sudo mv /opt/magic-gate/mglinux.sh /opt/magic-gate/magigate.sh
	sudo rm /opt/magic-gate/mgmac.sh
	
else
	# macOS
	
	# Move folder
	sudo mkdir ~/Library/Application\ Support/MagicGate/
	cd
	sudo cp -r ~/magic-gate/ ~/Library/Application\ Support/MagicGate/
	rm -rf ~/magic-gate
	
	# Editing the .bashrc
	echo "alias magicgate='sh ~/Library/Application\ Support/MagicGate/magicgate.sh' " >> ~/.bashrc
	zenity --info --width 500 --text="Done. Type 'source ~/.bashrc' or open a new terminal window to use Magic Gate."
	
	# Renaming the launcher and deleting the other one
	sudo mv ~/Library/Application\ Support/MagicGate/mgmac.sh ~/Library/Application\ Support/MagicGate/magicgate.sh
	sudo rm ~/Library/Application\ Support/MagicGate/mglinux.sh
	
fi