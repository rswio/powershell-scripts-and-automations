$ServiceName = "Spooler" # Replace with your service
$Servers = @("Server1", "Server2")

foreach ($Server in $Servers) {
    $Status = Get-Service -Name $ServiceName -ComputerName $Server
    Write-Output "Service $ServiceName on $Server is $($Status.Status)."
}
