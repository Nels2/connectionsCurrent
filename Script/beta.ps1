$FileNameTwo = "C:\connectionsCurrent\FakeLocalDirectory\connectionsCurrent.pptx" # local file that will have its' hashes compared to the new one.
$LocalDir = "C:\connectionsCurrent\FakeLocalDirectory\" # local directory where the network file will be copied to.
$ppt = "c:\Program Files\Microsoft Office\root\Office16\powerpnt.exe"#powerpoint.exe location -- previous method of saving files ass .pps/.ppsx would corrupt the file.
$FileTime = Get-Date
Write-Output ">>Today's Date & Current Time: $Filetime"
Write-Output ">>You are using connectionsCurrent, a small network-copy script made for CBT."
Write-Output ">>Made By: Nelson Orellana on Sept. 2021"
Write-Output ">>Social: Nels2/GitHub"
Write-Output "|  "
Write-Output "|  "
# endless loop
for () {
    # The command below will split the username property into two using the backslash '\' character as the delimiter.
    # The [1] part at the end tells the command to return only the result at index 1.
    # Indexes start with 0, which means specifying index 1 will show the result at the second position.
    $dauser= ((Get-WMIObject -ClassName Win32_ComputerSystem).Username).Split('\')[1]
    $FileName = "C:\Users\$dauser\OneDrive - Century Business Technologies Inc\Company Documents\Connection\connectionsCurrent.pptx" #Network location / network file
    $file = Get-Item -force $FileName
    if ($FileTime -ne $file.LastWriteTime) {
        Get-Process powerpnt*  
        Stop-Process -name POWERPNT -Force -ErrorAction Ignore
        if((Get-FileHash $FileNameTwo).hash  -ne (Get-FileHash $FileName).hash)
            {">>Files are different, copying in new one to local directory! ..."}
            #Check destination path
            if (Test-Path $FileName)
                {
                #then copy
                xcopy $FileName $LocalDir /E /Z /F /R /y
                }
                #now to launch the powerpoint and play the slideshow
            $NewFile = $FileNameTwo
            $daet = Get-Date -DisplayHint Date #misspelled date on purpose.
            $filed = Split-Path -Path $Newfile -Leaf -Resolve #splitting up file path so i can make output look a bit more neater.
            Write-Output ">>Launching $daet's $filed! ..."
            cmd /k "$ppt" /S "$NewFile"#using cmd commmands through powershell to launch powerpoint with $Newfile in slideshow view 
            #Start-Process $NewFile #will launch just the powerpoint in the Office application.
    }
    $FileTime = $file.LastWriteTime
    Start-Sleep -Seconds 5
}
