Get-ADUser -Filter * -Property DisplayName, EmailAddress, Department | Select-Object Name, SamAccountName, EmailAddress, Department | Export-Csv -Path "ADUsers.csv" -NoTypeInformation
Write-Output "All AD users exported to ADUsers.csv."
