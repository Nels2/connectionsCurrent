# connectionsCurrent
The network-copy script. This started as a offline project for my company, but have since removed all references to it, and uploading here as a back up.

# What this script does (`beta.ps1`)
To start, there is a power point(connectionsCurrent) that is basically just current events for the day. This is a little project that I started for my company because they wanted a powerpoint to run on a set of displays. They also wanted the power point to switch to current day once a new one has been made and stored in a specific network share.
- First it compares hashes / date last touched of network share version(FakeNetworkShare) and local version.
- Next, if the files are different, it copies over the new `.pptx` file from (FakeNetworkShare)/(SharePoint Location) to local dir(FakeLocalDirectory).
- Then displays said `.pptx` file from the local dir(FakeLocalDirectory). 
- runs on a loop that just repeats above.
# a little more information...
- If this is going to replicated for some reason by someone else for testing purposes, make sure the directory 'FakeNetworkShare' has been set up as a network share via windows properties. (optional)
- You will *need* to set up a dummy user for sharepoint that has read-only access for the directory you are grabbing the file from.
- The same dummy user mentioned above needs to have access to Powerpoint/Office and you will **need** to sign into the **machine running the script & accept the license agreement.** -- *skipping this usually won't let the powerpoint run.
- You *should* set up a dummy local windows log-in user that has no password and auto logs in.
- Must set up both or the script will NOT run.
- you *could* edit Display/sleep settings so machine never sleeps or turns off. This is **Optional**.
# How to set this up on a physical machine...
1. Create a dummy local user or use an existing one. \
 **OPTIONAL -- setting up auto-login for dummy local user**: 
    1. Press Win + R and type in 'regedit' and open as Admin.
    2. Navigate to `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device`
    3. Change the value of `DevicePasswordLessBuildVersion` to `0`.
    4. restart computer and you should auto-login
2. Copy 'connectionsCurrent' into C:/.
3. Login into OneDrive from taskbar/Start menu. (**Needs** to have access to whatever network/SharePoint drive that is going to be used obviously)
4. Login into Office/PowerPoint with a user that has a license and accept the license agreement.
5. Add script.bat (shortcut) to windows start up folder & desktop folder.. explained further below (*setting up script to run from start-up*)
6. You can **manually** run the script by creating a shortcut of 'script.bat' and placing it on desktop from the 'Scripts' folder-- or just running it directly.
## Setting up script to run from start-up:
1. Press Win + R
2. Type in: `shell:startup` & press Enter.
3. Create a shortcut of `script.bat` from `C:\connectionsCurrent\Script` folder and copy to **desktop folder** as well **startup folder**.
4. Rename the shortcut to `script`
## You should be free to restart and the script will display the power point upon login *
* - depending on your hard drive and start up apps set up, the time it takes to start may take a couple seconds.
# Directory Tree for reference:
KEY: ** *=directory, ||= means under the* and is a directory, |||= same thing as the ||, $= file** *
---------------------------------------------------------------------------
- |**C:\**
- |--*connectionsCurrent(root)
- |----------||---*connectionsCurrentXXX
- |--------------------|||----`$connectionsCurrent`
- |----------||---*connectionsCurrentXXX
- |--------------------|||----`$connectionsCurrent`
- |----------||---*connectionsCurrentXXX
- |--------------------|||----`$connectionsCurrent`
- |----------||---*Script
- |--------------------|||----`$beta.ps1`
- |--------------------|||----`$script.bat`
- |----------||---*FakeNetworkShare
- |--------------------|||----`$connectionsCurrent`
- |----------||---*FakeLocalDirectory
- |--------------------|||---`-$connectionsCurrent`
- |--*shell:startup
- |----------`$script.bat`(shortcut)
- |--*Desktop
- |----------`$script.bat`(shortcut)
---------------------------------------------------------------------------
