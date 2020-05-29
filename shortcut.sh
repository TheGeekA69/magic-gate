#!/bin/bash

# Prompt for folder path
read -p "Where is the MagicGate folder?   " path


# Editing the .bashrc
echo "alias magicgate='cd $path; sh magicgate.sh' " >> ~/.bashrc
echo $path >> ~/.folderpath
echo "Done. Type 'source ~/.bashrc' or open a new terminal window to use the command."