$Threshold = (Get-Date).AddDays(-180) # Adjust the inactivity threshold
Get-ADUser -Filter {LastLogonDate -lt $Threshold} | ForEach-Object {
    Disable-ADAccount -Identity $_.SamAccountName
    Write-Output "Disabled inactive user: $($_.SamAccountName)."
}
