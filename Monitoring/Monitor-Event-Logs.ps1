$Servers = @("Server1", "Server2") # Replace with your servers
foreach ($Server in $Servers) {
    Get-EventLog -LogName System -ComputerName $Server -EntryType Error -Newest 10
}
