$FileNameTwo = "C:\connectionsCurrent\FakeLocalDirectory\connectionsCurrent.pptx" # local file that will have its' hashes compared to the new one.
$LocalDir = "C:\connectionsCurrent\FakeLocalDirectory\" # local directory where the network file will be copied to.
$FileTime = Get-Date
Write-Output "----- You are using connectionsCurrent, a small network-copy script made for CBT. -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                           Made by: nelson orellana                          -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                                                                             -----"
# endless loop
for () {
    # The command below will split the username property into two using the backslash '\' character as the delimiter.
    # The [1] part at the end tells the command to return only the result at index 1.
    # Indexes start with 0, which means specifying index 1 will show the result at the second position.
    $dauser= ((Get-WMIObject -ClassName Win32_ComputerSystem).Username).Split('\')[1]
    $FileName = "C:\Users\$dauser\OneDrive_Location\Connection\connectionsCurrent.pptx" #Network location / network file
    $file = Get-Item -force $FileName
    if ($FileTime -ne $file.LastWriteTime) {
        Get-Process powerpnt*  
        Stop-Process -name POWERPNT -Force -ErrorAction Ignore
        if((Get-FileHash $FileNameTwo).hash  -ne (Get-FileHash $FileName).hash)
            {"files are different, copying in new one to local directory.."}
            #Check destination path
            if (Test-Path $FileName)
                {
                #then copy
                xcopy $FileName $LocalDir /E /Z /F /R /y
                }
                #now to launch the powerpoint and play the slideshow
            $ppt = $FileNameTwo
            $app = New-Object -ComObject powerpoint.application
                        $pres = $app.Presentations.open($ppt)
                        $pres.SlideShowSettings.Run()
                        #$pres.visible = "msoTrue" # this for some reason doesn't work but I', curious about it so, leaving it in.
    }
    $FileTime = $file.LastWriteTime
    Start-Sleep -Seconds 5
}
