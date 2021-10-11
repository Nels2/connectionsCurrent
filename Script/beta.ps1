$FileNameTwo = "C:\connectionsCurrent\FakeLocalDirectory\connectionsCurrent.ppsx" # local file that will have its' hashes compared to the new one.
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
    $FileName = "C:\Users\$dauser\OneDrive - Century Business Technologies Inc\Company Documents\Connection\connectionsCurrent.ppsx" #Network location / network file
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
                xcopy $FileName $LocalDir /E /Z /L /y
                Write-Output "$Filename has been copied to $LocalDir"
                }
            $NewFile = $FileNameTwo
            Start-Process $NewFile
    }
    $FileTime = $file.LastWriteTime
    Start-Sleep -Seconds 5
}
