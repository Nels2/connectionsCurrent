# connectionsCurrent
This started as a offline project for my company, but have since removed all references to it, and uploading here as a back up.

# What this script does (beta.ps1)
To start, there is a power point(connectionsCurrent) that is basically just current events for the day. This is a little project that I started for my company because they wanted a powerpoint to run on a set of displays. They also wanted the power point to switch to current day once a new one has been made and stored in a specific network share.
- First it compares hashes / date last touched of network share version(FakeNetworkShare) and local version.
- Next, if the files are different, it copies over the new file(a *.ppsx file*) to local dir.
- Then displays said .ppsx file from the local dir(FakeLocalDirectory). 
- runs on a loop that just repeats above.
# a little more information...
- Set up 'script.bat' under task scheduler to run with the highest privileges for your desired time.
- If this is going to replicated for some reason by someone else for testing purposes, make sure the directory 'FakeNetworkhare' has been set up as a network share via windows properties.
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
