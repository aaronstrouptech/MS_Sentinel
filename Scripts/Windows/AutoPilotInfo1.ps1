param($Source)

$drives = [System.IO.DriveInfo]::GetDrives()
$r = $drives | Where-Object { $_.DriveType -eq 'Removable' -and $_.IsReady }
if (!$r) {
    throw "No removable drives found."
}

$drive = @($r)[-1]
New-Item -Type Directory -Path "C:\HWID"
Set-Location -Path "C:\HWID"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
Install-Script -Name Get-WindowsAutoPilotInfo -Force
Get-WindowsAutoPilotInfo.ps1 -OutputFile AutoPilotHWID.csv
## Copy-Item -LiteralPath "C:\HWID\AutoPilotHWID.csv" -Destination $drive.Name -Confirm -Recurse
$SourceFile = "C:\HWID\AutoPilotHWID.csv"
$DestinationFile = "$drive.Name"

If (Test-Path $DestinationFile) {
    $i = 0
    While (Test-Path $DestinationFile) {
        $i += 1
        $DestinationFile = "C:\Temp\NonexistentDirectory\File$i.txt"
    }
} Else {
    New-Item -ItemType File -Path $DestinationFile -Force
}

Copy-Item -Path $SourceFile -Destination $DestinationFile -Force