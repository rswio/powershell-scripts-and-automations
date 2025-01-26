$Servers = @("Server1", "Server2")  # Replace with the names of your servers
$ServiceName = "Spooler"            # Replace with the service name you want to monitor

foreach ($Server in $Servers) {
    $Service = Get-Service -Name $ServiceName -ComputerName $Server
    if ($Service.Status -ne "Running") {
        Start-Service -Name $ServiceName -ComputerName $Server
        Write-Output "Started $ServiceName on $Server"
    }
}
