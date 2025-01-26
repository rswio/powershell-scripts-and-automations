$GroupName = "Domain Admins" # Replace with the group name
Get-ADGroupMember -Identity $GroupName | Select-Object Name, SamAccountName
