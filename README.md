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
- Add script to windows start up.. explained further below (*setting up script to run from start-up*)
- Login into OneDrive from taskbar. (has to have access to whatever network drive that is going to be used obviously)
- Run Script by creating a shortcut of 'script.bat' and placing it on desktop from the 'Scripts' folder. Make sure that it has been set to ALWAYS run with admin rights via properties -> advanced -> Run as Admin. 
## Setting up script to run from start-up:
- Go to Task Scheduler
- Under Top-Pane select 'Action'
- Now select 'Create Task'
- Under Name:, put: connectionsCurrent-Launcher
- Make sure you have selected 'Run with highest privileges'
- Make sure you have the 'Configure for:' option is set to 'Windows 10'
### Under the Triggers tab
- Select 'New'
- set 'Begin the Task:' to 'At log on'
- set 'Settings' to any user
- Press 'OK'
### Under Actions tab
- Set 'Action' to 'Start a program'
- Under 'Program/script:' type in Powershell.exe
- Under 'Add arguments (optional):' type in -executionpolicy bypass if (Test-path C:\connectionsCurrent\Script\beta.ps1) { C:\connectionsCurrent\Script\beta.ps1 } else { return -1 }
- Press 'OK'
### Under Conditions tab
- Unselect 'Start the task only if the computer is on AC Power'
- Under Settings tab
- Unselect 'Stop the task if it runs longer than:'
- Select 'Run task as soon as possible after a scheduled start is missed'
## You should be free to restart and the script will display the power point upon login
# Directory Tree for reference:
KEY: ** *=directory, ||= means under the* and is a directory, |||= same thing as the ||, $= file**
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
---------------------------------------------------------------------------
