# Replace the $GroupName and $SamAccountNam
Add-ADGroupMember -Identity $GroupName -Members $SamAccountName

# Example
Add-ADGroupMember -Identity "IT-Admins" -Members "john.doe"
