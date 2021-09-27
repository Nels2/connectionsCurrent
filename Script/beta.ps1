$FileName = "\\path\to\connectionsCurrent.ppsx"
$FileNameTwo = "path\to\connectionsCurrent\FakeLocalDirectory\connectionsCurrent.ppsx"
$LocalDir = "path\to\connectionsCurrent\FakeLocalDirectory\"
$FileTime = Get-Date
{"----- You are using connectionsCurrent, a small network-copy script made for CBT. -----"}
# endless loop
for () {
    $file = Get-Item $FileName
    if ($FileTime -ne $file.LastWriteTime) {
        try {
            Get-Process powerpnt* | Stop-Process
            Stop-Process -name POWERPNT -Force
        }
        catch {
            {"!WARNING!: PowerPoint is not currently running."}
        }
        if((Get-FileHash $fileNameTwo).hash  -ne (Get-FileHash $fileName).hash)
            {"!NOTICE!: files are different, copying.."}
            #Check destination path
            if (Test-Path $FileName)
                {
                #then copy
                robocopy $FileName $LocalDir /MIR /Z /E /fft 
                }
            $NewFile = "path\to\connectionsCurrent\FakeLocalDirectory\connectionsCurrent.ppsx"
            Invoke-Item $NewFile
    }
    $FileTime = $file.LastWriteTime
    Start-Sleep 10
}