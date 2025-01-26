Get-EventLog -LogName Security -EntryType SuccessAudit -Newest 1000 | Where-Object {
    $_.Message -match "Failed logon"
}
