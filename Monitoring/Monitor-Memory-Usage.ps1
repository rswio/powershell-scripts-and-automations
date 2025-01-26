$Servers = @("Server1", "Server2") # Replace with server names
foreach ($Server in $Servers) {
    $Memory = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Server
    $UsedMemory = $Memory.TotalVisibleMemorySize - $Memory.FreePhysicalMemory
    Write-Output "Memory usage on $Server: $($UsedMemory / $Memory.TotalVisibleMemorySize * 100)%."
}
