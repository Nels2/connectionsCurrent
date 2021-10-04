$FileNameTwo = "C:\path\to\connectionsCurrent\FakeLocalDirectory\connectionsCurrent.ppsx"
$LocalDir = "C:\path\to\connectionsCurrent\FakeLocalDirectory\"
$FileTime = Get-Date
Write-Output "----- You are using connectionsCurrent, a small network-copy script made for CBT. -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                           Made by: nelson orellana                          -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                                                                             -----"
# endless loop
for () {
    $FileName = "path\to\connectionsCurrent.ppsx"
    $file = Get-Item -force $FileName
    if ($FileTime -ne $file.LastWriteTime) {
        Get-Process powerpnt*
        Stop-Process -name POWERPNT -Force -ErrorAction Ignore
        if((Get-FileHash $fileNameTwo).hash  -ne (Get-FileHash $fileName).hash)
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
