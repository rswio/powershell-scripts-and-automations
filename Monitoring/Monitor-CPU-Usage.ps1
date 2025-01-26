$Servers = @("Server1", "Server2") # Replace with your servers
foreach ($Server in $Servers) {
    $CPU = Get-WmiObject -Class Win32_Processor -ComputerName $Server | Measure-Object -Property LoadPercentage -Average
    Write-Output "CPU usage on $Server: $($CPU.Average)%."
}
