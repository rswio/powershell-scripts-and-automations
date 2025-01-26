# With this script, you can create new users and secify where they are created
New-ADUser -Name "John Doe" -SamAccountName "john.doe" -UserPrincipalName "john.doe@domain.com" -Path "OU=Users,DC=domain,DC=com"

# Use the below to set the email address too
New-ADUser -Name "John Doe" -SamAccountName "john.doe" -UserPrincipalName "john.doe@domain.com" -Path "OU=Users,DC=domain,DC=com" -EmailAddress "john.doe@example.com"

## Other options that you can include with the above:

# Proxy email addresses too. 'SMTP:' identifies the primary email (which you should include as well as other addresses) and smtp will be 'smtp:' should be used for all other email aliases
-OtherAttributes @{'proxyAddresses' = @('SMTP:jdoe@example.com', 'smtp:alias@example.com')}

# Display name - if you don't set this, the name will be used
-DisplayName "John Doe"

# Department
-Department "IT"

# Job Title
-Title "System Administrator"

# Office
-Office "London HQ"

# Main telephone number
-OfficePhone "020 xxxx xxxx"

#Mobile phone number
-MobilePhone "07900 xxx xxx"

# Set the users manager. This is useful for the built in organisation hierarchy
-Manager "CN=Jane Smith,OU=Users,DC=example,DC=com"

# Set the logon script
-ScriptPath "logon.bat"

# Map a users drive
-HomeDirectory "\\server\users\jdoe" -HomeDrive "H:"

# Set an account expiry date based on x days
-AccountExpirationDate (Get-Date).AddDays(30)

# Set the users password
-AccountPassword (ConvertTo-SecureString "P@ssw0rd1234" -AsPlainText -Force)

# Require the user change their password on first login
-ChangePasswordAtLogon $true

