# Magic Gate

https://github.com/TheGeekA69/magic-gate
https://thegeeka69.com/magic-gate/

Magic Gate is a utility written entirely in bash to help you interact with your Android device over USB or Wi-Fi. I have been trying free and commercial utilities over the past years, but they were either paid or outdated. 

Magic Gate is (as of now at least) composed of three Modules. Each module has a specific use:


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

Disclaimer: this module is **not** mine. Credits go to Genymobile at https://github.com/Genymobile/scrcpy. I tweaked a few settings and applied them by default for a better experience (in my opinion). Feel free to tune them to your taste (looking at you, bitrate).

So Screen Copy (yes, that's what it means) mirrors your device's screen and lets you interact with it using mouse and keyboard. Some shortcuts are shown on my website, the rest can be seen by running `scrcpy --help` in a terminal. 



# Installation:

## Initialization: 
Extract the magic-gate folder **to the root** of your account and in a terminal, change directory:

	cd ~/magic-gate-master

Execute install.sh with 

`sh install-linux.sh` for any Linux-based system or `sh install-macos.sh` on Macs
	
and enter your password as prompted. Magic Gate needs to transfer it files to directories requiring root access. It will add the 'magicgate' alias to your `.bashrc` (or `.zshrc` on macOS) and clean up after the installation. Source your `.bashrc` (or `.zshrc`) and type `magicgate` in a terminal to start the script.


## Dependencies: adb, scrcpy (if you want to use it) and zenity

### Debian / Ubuntu:

		 sudo apt install adb scrcpy zenity
		 
(note: 'scrcpy' might not be found. In that case, install it with snapcraft (https://snapcraft.io) or compile it yourself.

(note 2: zenity is only necessary on Desktop Environments that are *not* GNOME since it is a GNOME package, but it works everywhere.)
	
### Arch:
		sudo pacman -S adb zenity
		
**Check out the AUR for 'scrcpy' or compile it from source and add it to your $PATH.**
			
### macOS:
You'll need homebrew first: https://brew.sh

Then do:

		brew cask install android-debug-bridge
		brew install scrcpy zenity
			
### Other *NIX:

If you use something else than the other distros above, I take it you'll know how to make this work.
		
### Windows:
Why are you doing this to yourself?

More importantly: you can download Ubuntu 20.04 LTS from the Windows Store and follow the instructions for Debian / Ubuntu. Be sure to turn on VNC!
(or else just use the old, CLI-only, Magic Gate)
			
			
If you spot a bug, please create an issue post!
	


# Known bugs / FAQ:
### Files with a space in the name are not sent and crash Teleporter
=> Replace the space with an underscore ( _ ). I won't fix this, it's a limitation of bash/zenity. If you have an idea though, I'm all ears (in the pull section).
		
### ADB returned with 'code/blabla' 1...
=> That means your device isn't connected wirelessly with ADB. Make sure you follow the instructions here:

https://developer.android.com/studio/command-line/adb#wireless

=> Alternatively, just use USB :)
		
### Where is the Magic Gate directory?
=> On macOS: ~/Library/Application\ Support/MagicGate/

=> On Linux: /opt/magic-gate/

Only change if you know what you are doing!

### Something else doesn't work
=> Read this document again please.

=> You've re-read it and it's still there? Then submit an issue on Github. I'll see what I can do to help you :)


Cheers !

TheGeekA69 (Alexis CAPPE)
