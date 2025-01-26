Get-ADUser -Filter {LockedOut -eq $true} | Select-Object Name, SamAccountName | Export-Csv -Path "LockedOutUsers.csv" -NoTypeInformation
Write-Output "Exported locked-out users to LockedOutUsers.csv."
