# Magic Gate



This was a project I thought of because I sometimes needed to transfer files quickly, or needed to experiment with my phone and run commands. Thing is, I'm incredibly lazy and my phone was often a hand away - too far away.

So I coded Magic Gate. What was at first a bunch of modular scripts to be executed in a terminal emulator soon became an entreprise to get a GUI because of popular (aka, my friends') demand.

I also had been using Scrcpy (to mirror my phone's screen and interact with it). Credits go to Genymobile over here: https://github.com/Genymobile/scrcpy 

So why Magic Gate? 
Because the commercial alternatives were limited, our outdated. So here's what you need!

# What does it do?

Magic Gate is (as of now at least) composed of three Modules. Each module has a specific job. They all work either via USB or WiFi.


## Teleporter

Teleporter transfers files **from** your PC **to** you Android device (the opposite is currently under development. May or not be implemented depending on feasability). **Make sure your files have no spaces in their names!**
It can transfer three kinds of files:

### Music

Speaks for itself, the files you can choose include all the common lossless and lossy formats (mp3, aac, flac, etc.). They will automatically be sent to your Music/ folder and will be picked up by music players. 

### Photos and Videos

They are sent to your DCIM/Camera folder on internal storage. As I lack information about SD cards paths, I cannot include the option to send them to the SD card instead.

### Other

That includes any type of file you want to send. Yes, any of them. They will be sent to the Documents/ folder.

## Shell

Shell is made to run commands on your Android device, sent from your PC. Useful for developers, tweakers and customization enthusiasts. Can also be used to send files from your device to your pc if you know how to use adb.

## Scrcpy

Disclaimer: this module is **not** mine. See above for credits. I tweaked a few settings and applied them by default for a better experience (in my opinion). Feel free to tune them to your taste (looking at you, bitrate).

So Screen Copy (yeah, that's what it means) mirrors your device's screen and lets you interact with it using mouse and keyboard. Some shortcuts are provided when running the module, the rest can be seen by running `scrcpy` in a terminal. 



# Installation:

## Initialization: 
Navigate to the MagicGate folder (where you put it):

	cd path/to/MagicGate/

Execute shortcut.sh with 

	sh shortcut.sh
	
and follow the instructions. It will add the 'magicgate' alias to your .bashrc. Use this `magicgate` to start the script.

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

Then do:

		brew cask install android-debug-bridge
		brew install scrcpy zenity
			
### Other *NIX:

Bruh, if you use something else than the other distros above, you'll know how to make this work.
		
### Windows:
Why are you doing this to yourself?

More importantly: you can download Ubuntu 20.04 LTS from the Windows Store and follow the instructions for Debian / Ubuntu. Be sure to turn on VNC!
(or else just use the old, CLI-only, Magic Gate)
			
			
If you spot a bug, please create an issue post!
	


# Known bugs / FAQ:
### Files with a space in the name are not sent and crash Teleporter
=> Replace the space with an underscore ( _ ). Won't fix this, it's a limitation. If you have an idea though, I'm all ears.
		
### ADB returned with 'code/blabla' 1...
=> That means your device isn't connected wirelessly with ADB. Make sure you follow the instructions here:

https://developer.android.com/studio/command-line/adb#wireless

=> Alternatively, just use USB :) (yeah it sucks, I know)
		
### Something else doesn't work
=> Read this document again please.

=> You've re-read it and it's still there? Then submit an issue on Github. I'll see what I can do to help you :)


Cheers !

TheGeekA69 (Alexis CAPPE)
