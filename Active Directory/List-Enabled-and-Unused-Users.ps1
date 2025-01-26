# Set the date to 180 days ago from today
$d = [DateTime]::Today.AddDays(-180)

# Retrieve enabled users and filter those with PasswordLastSet or LastLogonTimestamp older than $d
Get-ADUser -Filter "Enabled -eq 'True'" -Properties PasswordLastSet, LastLogonTimestamp |
    Where-Object {
        ($_.LastLogonTimestamp -and ([datetime]::FromFileTime($_.LastLogonTimestamp) -lt $d))
    } |
    Format-Table Name, PasswordLastSet, @{
        Name       = "LastLogonTimestamp"
        Expression = { if ($_.LastLogonTimestamp) { [datetime]::FromFileTime($_.LastLogonTimestamp) } else { "Never" } }
    }
