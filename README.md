# OSA-FLASH

Contains the source files to create the OSA.swf that gets packed in OSA for distribution.
OSA is a skyrim mod that allows Skyrim animation to have much more potential with a clean easy to use UI to allow for the animation to also be interactive

A vast majority of what OSA does is handled in the OSA.swf. 

OSA and Papyrus speak to each other like this:
Papyrus triggers functions in the OSA.swf using ui.invoke and the OSA.swf triggers things in papyrus by sending back events.

It's much easier to develop OSA without having to boot up Skyrim however a lot of the functions that Skyrim would send from OSA's papyrus have to be manually recreated.

Here's a quick outline on working on OSA from flash:

# KeySim in OSA Flash

For development I use a few hot keys which simulate events that Skyrim would be sending.
These events have to be manually sent to be able to work directly in flash on the project.



The keys to replicate Skyrim are set in OMajor in a function called keySim()

Here are the steps from flash to get it running:

1. Make sure you are focused in the program on any script, for example: "OMajor" instead of OSA
2. CTRL + ENTER: Compiles the swf and runs it
3. You'll see a grey screen
4. Hit NumPad Enter  (0) to start, at this point you'll see nothing
5. Hit 1 twice, this simulates skyrim adding an actor (two of them)
6. Hit 5 twice, this simulates Skyrim sending the actor's equipment data (once for each actor) 

To confirm thats NumpadEnter + 1 + 1 + 5 + 5 to get started

there's a few other hot keys for specific situations during development like for loading in 3 character scenes etc. and keys for testing the inspection function but I have to brush up on thise.

Once you are in you can use the scene as normal. Num + will open up the menu. The output log also has a lot of information that might help figure out what's going on. 


There are also a few nuances to look for:

- The hotkeys are slightly different. 2 is used for down instead of 5 on the numpad

- If the input keys aren't working try changing NumLock

- My hot keys don't work right unless i have a script focused in Flash. Basically the OK key Num7 doesn't work. For example if OSA is focused in my flash program the keys are weird but if I switch to a script like OMajor they work fine.



ADDITIONAL NOTES

For testing persona and profiles

In the system/sim folder in this function -> simActraAdd()

This replicates the data gathered up by Skyrim from an NPC and is sent when you hit 1 at the hotkey startup. The first time you hit 1 the top data is sent and the 2nd time the bottom data is sent.

You can change the simulated formid for example to have it load different personas / profiles or change the race to test customizer or change the name etc.



# SETTING UP FLASH TO WORK

This was setup many years ago so it's hard for me to recall the exact details I followed to get this all working in Flash. The primary thing I can think of to look out for is that the export location is set up. You'll notice while OSA is running from the output log that it is loading or attempting to load text documents in xml format that are relative to the location of the OSA.swf
For OSA to work from flash these paths have be correct in relation to the OSA.swf. As a note some of the documents will not be reported not found even if you set things up correctly. These are most likely Persona Profile documents that are not there.

If anyone has better instructions on making the flash file work properly please feel free to update this.
