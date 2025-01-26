$Source = "C:\Data"                      # Replace with the folder you want to back up
$Destination = "\\BackupServer\Backups"  # Replace with the destination folder
Copy-Item -Path $Source -Destination $Destination -Recurse
Write-Output "Backup completed for $Source to $Destination"
