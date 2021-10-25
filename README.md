# connectionsCurrent
This started as a offline project for my company, but have since removed all references to it, and uploading here as a back up.

# What this script does (beta.ps1)
To start, there is a power point(connectionsCurrent) that is basically just current events for the day. This is a little project that I started for my company because they wanted a powerpoint to run on a set of displays. They also wanted the power point to switch to current day once a new one has been made and stored in a specific network share.
- First it compares hashes / date last touched of network share version(FakeNetworkShare) and local version.
- Next, if the files are different, it copies over the new file(a *.pps file*) to local dir.
- Then displays said .pps file from the local dir(FakeLocalDirectory). 
- runs on a loop that just repeats above.
# a little more information...
- Set up 'script.bat' under task scheduler to run with the highest privileges for your desired time.
- If this is going to replicated for some reason by someone else for testing purposes, make sure the directory 'FakeNetworkShare' has been set up as a network share via windows properties.
# How to set this up...
- Copy 'connectionsCurrent' into C:/.
- Add script to windows start up & desktop.. explained further below (*setting up script to run from start-up*)
- Login into OneDrive from taskbar. (has to have access to whatever network drive that is going to be used obviously)
- Run Script by creating a shortcut of 'script.bat' and placing it on desktop from the 'Scripts' folder. Make sure that it has been set to ALWAYS run with admin rights via properties -> advanced -> Run as Admin. 
## Setting up script to run from start-up:
- Press Win + R
- Type in: shell:startup
- Take 'script.bat' from Script folder and place on **desktop** as well **startup folder**.
## You should be free to restart and the script will display the power point upon login
## * - depending on your hard drive and start up apps the time it takes to start may take a couple seconds.
# Directory Tree for reference:
KEY: ** *=directory, ||= means under the* and is a directory, |||= same thing as the ||, $= file** *
---------------------------------------------------------------------------
- |--*connectionsCurrent(root)
- |----------||---*connectionsCurrent910
- |--------------------|||----$connectionsCurrent
- |----------||---*connectionsCurrent913
- |--------------------|||----$connectionsCurrent
- |----------||---*connectionsCurrent920
- |--------------------|||----$connectionsCurrent
- |----------||---*Script
- |--------------------|||----$beta.ps1
- |--------------------|||----$script.bat
- |----------||---*FakeNetworkShare
- |--------------------|||----$connectionsCurrent
- |----------||---*FakeLocalDirectory
- |--------------------|||----$connectionsCurrent
- |--*shell:startup
- |----------$script.bat
- |--*Desktop
- |----------$script.bat(shortcut)
- |----------$beta.ps1(shortcut)
---------------------------------------------------------------------------
