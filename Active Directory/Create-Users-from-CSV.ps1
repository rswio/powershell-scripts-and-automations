param ([string]$CSVPath)

$Users = Import-Csv $CSVPath
foreach ($User in $Users) {
    $Password = ConvertTo-SecureString $User.Password -AsPlainText -Force

    New-ADUser -GivenName $User.FirstName `
               -Surname $User.LastName `
               -SamAccountName $User.SamAccountName `
               -UserPrincipalName $User.Email `
               -DisplayName $User.DisplayName `
               -Department $User.Department `
               -Title $User.Title `
               -AccountPassword $Password `
               -Path $User.OU `
               -Enabled $true
}
