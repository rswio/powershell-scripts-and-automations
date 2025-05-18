Get-EventLog -List | ForEach-Object {
    try {
        Clear-EventLog -LogName $_.Log
    } catch {}
}
