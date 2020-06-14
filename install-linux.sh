#!/bin/bash


zenity --question --width 300 --text "You will need to enter your password in the terminal." --ok-label "Install" --cancel-label "Cancel"

if [[ $? -eq 1 ]]
then

	# they pressed Cancel or closed the dialog window 
	zenity --error --title="Magic Gate" --width=200 \
			 --text="Installation aborted."
	exit 1

else 
	
	sudo mkdir /opt/magic-gate
		cd
		sudo cp -r magic-gate/ /opt/magic-gate/
		rm -rf magic-gate

		# Editing the .bashrc
		echo "alias magicgate='sh /opt/magic-gate/magicgate.sh' " >> ~/.bashrc
		zenity --info --text="Done. Type 'source ~/.bashrc' or open a new terminal window to use Magic Gate."
		
		# Renaming the launcher and deleting the other one
		sudo mv /opt/magic-gate/mglinux.sh /opt/magic-gate/magigate.sh
		sudo rm /opt/magic-gate/mgmac.sh /opt/magic-gate/install-macos.sh

fi