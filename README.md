# PCSX2-TAS-TOOLS
based on Snuggles TAS TOOLS thx mate

+ First download PCSX2-rr 1.4.0 or 1.0.1, a Ps2 emulator for the tools included and needed for the lilypad key binding file
  - https://github.com/xTVaser/pcsx2-rr/releases/download/rr-1.0.1/PCSX2-rr_v1.0.1.zip

+ you'll need a BIOS downloaded on the internet for the emulator to work
  - go to Config -> BIOS
  - then select the folder where your BIOS files are
  - i don't think i'm legally allowed to post a link and there are so many tuto that explains the emulator's configuration

+ You'll need to download vJoy
  - this is a .exe file to install a virtual controller driver in order to use with an ahk script
  - https://sourceforge.net/projects/vjoystick/files/Beta%202.x/2.1.9.1-160719/vJoySetup.exe/download
  - search for the program "Configure vJoy" and be sure that the first controller's parameters are like this image
  - ![Capture](https://github.com/KMR1-1/PCSX2-TAS-TOOLS/assets/162009605/99729a32-d68e-4c08-8059-a3e3dc3d5093)

+ in PCSX2, go to Config -> Controller -> plugin Settings
  - then select "Load Bindings" (bottom right of the window)
  - open the "TAS LilyPad Config File.lily" file from this repo and apply the settings
  - this will automatically bind the virtual controller to the emulator
  - if you really want to use the lastest nightly qt version of PCSX2, you'll need to bind the keys by yourself with an ahk script

+ in PCSX2 go to Config -> Memory Card
  - then be sure that auto-eject is selected
 
+ Download Autohotkey v1,
  - v2 is another language and the libs from this repo are coded in v1

+ Put the three ahk scripts into the same directory
+ open "Example-Script.ahk" in a text editor like notepad++ to find detailed stuff about what this does
  - when you run the script by double clicking on the file, you'll see a "H" on your windows toolbar
  - this means your script is running, when you press like the "$" key you'll see into the script's code what function it launches
  - to get deep into the details, the functions are into the "function-lib.ahk" file
  - you'll find a list functions to use for tasing, and some examples, if you don't understand s*** just watch this
  - https://www.youtube.com/watch?v=QpP6gfQVXgs
  - this person made most of the coding i changed bunch of stuff and made new functions


