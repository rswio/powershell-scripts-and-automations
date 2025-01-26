$Servers = @("Server1", "Server2") # Replace with your servers
foreach ($Server in $Servers) {
    $Uptime = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Server | Select-Object LastBootUpTime
    Write-Output "$Server last rebooted on: $($Uptime.LastBootUpTime)."
}
