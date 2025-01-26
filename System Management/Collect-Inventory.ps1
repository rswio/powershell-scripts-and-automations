$Servers = @("Server1", "Server2")  # Replace with the servers to scan
$Output = @()

foreach ($Server in $Servers) {
    $OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Server
    $CPU = Get-WmiObject -Class Win32_Processor -ComputerName $Server
    $Output += [PSCustomObject]@{
        Server   = $Server
        OS       = $OS.Caption
        CPU      = $CPU.Name
        RAM      = $OS.TotalVisibleMemorySize
    }
}

$Output | Export-Csv -Path "SystemInventory.csv" -NoTypeInformation
Write-Output "System inventory collected"
