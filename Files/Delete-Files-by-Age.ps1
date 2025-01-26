$LogPath = "C:\Logs"         # Replace with the path to your log files
$RetentionDays = 30          # Replace with the number of days to retain logs

Get-ChildItem -Path $LogPath -Recurse | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$RetentionDays)
} | Remove-Item -Force
Write-Output "Old files removed from $LogPath"
