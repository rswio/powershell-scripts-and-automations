# Generate a random 32-byte array
$randomBytes = New-Object byte[] 32
[System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($randomBytes)

# Convert the byte array to a hexadecimal string
$hexString = -join ($randomBytes | ForEach-Object { "{0:X2}" -f $_ })

# Output the hexadecimal string
Write-Host "Random 32-byte Hexadecimal: $hexString"
