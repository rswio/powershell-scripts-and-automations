# PowerShell script to find instances of OpenSSL

# Function to search the entire system for openssl.exe
function Find-OpenSSL {
    param (
        [string]$RootPath = "C:\\"
    )
    
    Write-Output "Searching for OpenSSL (openssl.exe) in all directories under $RootPath..."
    Get-ChildItem -Path $RootPath -Recurse -Filter "openssl.exe" -ErrorAction SilentlyContinue
}

# Start the search from the root directory
$rootPath = "C:\"
$opensslInstances = Find-OpenSSL -RootPath $rootPath

if ($opensslInstances) {
    Write-Output "OpenSSL instances found:"
    $opensslInstances | ForEach-Object {
        $_.FullName
    }
} else {
    Write-Output "No instances of OpenSSL were found."
}
