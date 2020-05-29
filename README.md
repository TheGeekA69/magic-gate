Thank you for downloading Magic Gate!


This was a project I coded because I sometimes needed to transfer files quickly, or needed to experiment with my phone and run commands. Thing is, I'm incredibly lazy and my phone was often a hand away - too far away.
So I coded Magic Gate. What was at first a bunch of modular scripts to be executed in a terminal emulator soon became an entreprise to get a GUI because of popular (aka, my friends) demand.
I also had been using Scrcpy (to mirror my phone's screen and interact with it). Credits go to Genymobile over here: https://github.com/Genymobile/scrcpy 

So why Magic Gate? 
Because the commercial alternatives were limited, our outdated. So here's what you need!


# Installation:

## Shortcut: 
Navigate to the MagicGate folder (where you put it) and execute shortcut.sh with 

	sh shortcut.sh
	
It will add the 'magicgate' alias to your .bashrc. Use this `magicgate` to start the script.
**Don't change its location afterwards, or you'll need to run shortcut.sh again!**

## Dependencies: adb, scrcpy (if you want to use it), zenity

### Debian / Ubuntu:

		 sudo apt install adb scrcpy zenity
		 
(note: 'scrcpy' might not be found. In that case, install it with snapcraft (https://snapcraft.io.)

(note 2: zenity is only necessary on Desktop Environments that are *not* GNOME since it is a GNOME package, but it works everywhere.)
	
### Arch:
		sudo pacman -S adb zenity
		
**Check out the AUR for 'scrcpy' or compile it from source and symlink it.**
			
### macOS:
You'll need homebrew first: https://brew.sh
then do:

		brew cask install android-debug-bridge
		brew install scrcpy zenity
			
### Other *NIX:

Bruh, if you use something else than the other distros above, you'll know how to make this work.
		
### Windows:
Why are you doing this to yourself?

More importantly: you can download Ubuntu 20.04 LTS from the Windows Store and follow the instructions for Debian / Ubuntu. Be sure to turn on VNC!
(or else just use the old, CLI-only, Magic Gate)
			
			
If you spot a bug, please create an issue post on the Github page:
	https://github.io/TheGeekA69/magic-gate
	


# Known bugs / FAQ:
### Files with a space in the name are not sent and crash Teleporter
=> Replace the space with an underscore ( _ ). Won't fix this, it's a limitation. If you have an idea though, I'm all ears.
		
### ADB returned with 'code/blabla' 1...
=> That means your device isn't connected wirelessly with ADB. Make sure you follow the instructions here: https://developer.android.com/studio/command-line/adb#wireless
=> Alternatively, just use USB :) (yeah it sucks, I know)
		
### Something else doesn't work
=> Read this document again please.
=> You've re-read it and it's still there? Then submit an issue on Github. I'll see what I can do to help you :)


Cheers !

TheGeekA69 (Alexis CAPPE)
