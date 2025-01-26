$Groups = @("HR Team", "Finance Team", "IT Team") # Replace with group names
$OU = "OU=Groups,DC=example,DC=com"             # Adjust OU path

foreach ($Group in $Groups) {
    New-ADGroup -Name $Group -GroupScope Global -GroupCategory Security -Path $OU
    Write-Output "Created group: $Group."
}
