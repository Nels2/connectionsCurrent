$FileName = "\\COMPUTERNAME\FakeNetworkShare\connectionsCurrent.ppsx"
$FileNameTwo = "C:\path\to\dir\FakeLocalDirectory\connectionsCurrent.ppsx"
$FileTime = Get-Date

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
            Copy-Item -Path $file -Destination C:\path\to\dir\FakeLocalDirectory\
            $NewFile = "C:\path\to\dir\FakeLocalDirectory\connectionsCurrent.ppsx"
            Invoke-Item $NewFile
    }
    $FileTime = $file.LastWriteTime
    Start-Sleep 10
}
