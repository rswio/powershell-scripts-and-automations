$Servers = @("Server1", "Server2")  # Replace with your server names

foreach ($Server in $Servers) {
    Invoke-Command -ComputerName $Server -ScriptBlock {
        Install-WindowsUpdate -AcceptAll -AutoReboot  # Requires PSWindowsUpdate module
    }
    Write-Output "Patches installed on $Server"
}
