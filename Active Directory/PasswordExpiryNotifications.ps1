# You will have to amend the SMTP site of this, as detailed at https://github.com/rswio/powershell-automations/blob/main/SMTP/Send-Email-Basic.ps1

#################################################
# Configure the following variables?.
$smtpServer="mailserver.domain.com"
$expireindays0 = 28
$expireindays1 = 14
$expireindays2 = 7
$expireindays3 = 2
$expireindays4 = 1
$from = "Support <support@domain.com>"
$testing = "False" # Set to False to Email Users, True to email the test recipient
$testRecipient = "you@domain.com" # If testing is Enabled, all notifications go to this e-mail 
$DaysText = "days"
#################################################

#Get Users From AD who are enabled
Import-Module ActiveDirectory
$users = get-aduser -filter * -Properties enabled, passwordneverexpires, passwordexpired, emailaddress, passwordlastset |where {$_.Enabled -eq "True"} | where { $_.PasswordNeverExpires -eq $false } | where { $_.passwordexpired -eq $false }

foreach ($user in $users)
{
	$Name = (Get-ADUser $user | foreach { $_.Name})
	if (($testing) -eq "True")
	{
		$emailaddress = $testRecipient
	}
	else
	{
		$emailaddress = $user.emailaddress
	}
	$passwordSetDate = (get-aduser $user -properties passwordlastset | foreach { $_.PasswordLastSet })
	$PasswordPol = (Get-AduserResultantPasswordPolicy $user)
	# Check for Fine Grained Password
	if (($PasswordPol) -ne $null)
	{
		$maxPasswordAge = ($PasswordPol).MaxPasswordAge
	}
	else
	{
		$maxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge
	}
	$expireson = $passwordsetdate + $maxPasswordAge
	$today = (get-date)
	$daystoexpire = (New-TimeSpan -Start $today -End $Expireson).Days
    if ($daystoexpire -eq 1)
    {
        $DaysText = "day"
    }
	$subject = "Your password will expire in $daystoExpire $DaysText"
	$body = "<p>Hi $Name<br />
	<br />
	Please note that your password will <b>expire in $daystoexpire $DaysText</b>.<br />
	<br />
	To change your password, do one of the below:
	<h3>WHEN YOU ARE IN THE OFFICE:</h3>
	Press CTRL+ALT+DEL and select 'Change Password'.<br />
  <h3>WHEN YOU ARE OUT OF THE OFFICE:</h3>
	For best results, connect to the VPN, wait for a few minutes for the connection to be established, press CTRL+ALT+DEL and select 'Change Password'.<br />
  <h3>NEED HELP?:</h3>
	Please contact IT and we will assist you.<br />
	<br />
	Regards<br />
	<br /> 
	IT Team<br />
	<br />
	<em>Remember that for security purposes, we will never include a link when reminding you about password changes.</em>
	</P>"

	if (($daystoexpire -eq $expireindays0) -or ($daystoexpire -eq $expireindays1) -or ($daystoexpire -eq $expireindays2) -or ($daystoexpire -eq $expireindays3) -or ($daystoexpire -eq $expireindays4))
	{
        Write-Host "Name: $Name | Email: $emailaddress | maxPasswordAge: $maxPasswordAge | Expireson: $expireson"
		    Send-Mailmessage -smtpServer $smtpServer -from $from -to $emailaddress -subject $subject -body $body -bodyasHTML -priority High
	}

} 
