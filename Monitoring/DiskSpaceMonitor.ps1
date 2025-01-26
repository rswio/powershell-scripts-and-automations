$Threshold = 20 # Percentage
$Drives = Get-PSDrive -PSProvider FileSystem

foreach ($Drive in $Drives) {
    $FreeSpacePercent = ($Drive.Free / $Drive.Used) * 100
    if ($FreeSpacePercent -lt $Threshold) {
        Write-Output "Low disk space on $($Drive.Root): $FreeSpacePercent% free"
    }
}
