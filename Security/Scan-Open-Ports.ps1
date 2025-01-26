$Server = "Server1"  # Replace with the server name
$Ports = 20..25      # Replace with the range of ports
foreach ($Port in $Ports) {
    Test-NetConnection -ComputerName $Server -Port $Port
}
