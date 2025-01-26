$Threshold = 20  # Change this value to set the disk space alert threshold (percentage)
$Drives = Get-PSDrive -PSProvider FileSystem

foreach ($Drive in $Drives) {
    $FreeSpacePercent = ($Drive.Free / $Drive.Used) * 100
    if ($FreeSpacePercent -lt $Threshold) {
        Write-Output "Low disk space on $($Drive.Root): $FreeSpacePercent% free"
    }
}
