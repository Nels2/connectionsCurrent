$FileName = "path\to\connectionsCurrent.ppsx"
$FileNameTwo = "path\to\connectionsCurrent\FakeLocalDirectory\connectionsCurrent.ppsx"
$LocalDir = "path\to\connectionsCurrent\FakeLocalDirectory\"
$FileTime = Get-Date
Write-Output "----- You are using connectionsCurrent, a small network-copy script made for CBT. -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                           Made by: nelson orellana                          -----"
Write-Output "-----                                                                             -----"
Write-Output "-----                                                                             -----"
# endless loop
for () {
    $file = Get-Item $FileName
    if ($FileTime -ne $file.LastWriteTime) {
        Get-Process powerpnt*
        Stop-Process -name POWERPNT -Force -ErrorAction Ignore
        if((Get-FileHash $fileNameTwo).hash  -ne (Get-FileHash $fileName).hash)
            {"files are different, copying in new one to local directory.."}
            #Check destination path
            if (Test-Path $FileName)
                {
                #then copy
                robocopy $FileName $LocalDir /MIR /Z /E /fft
                }
            $NewFile = $FileNameTwo
            Start-Process $NewFile
            Write-Output "The directory name is not invalid."
    }
    $FileTime = $file.LastWriteTime
    Start-Sleep -Seconds 5
}
