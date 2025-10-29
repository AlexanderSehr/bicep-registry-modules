function Get-AppToken {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string] $ApplicationId,
        [Parameter()]
        [string] $InstallationId,
        [Parameter()]
        [string] $PrivateKey
    )

    # Variables
    # $ApplicationId = '<YOUR_APP_ID>'
    # $InstallationId = '<YOUR_INSTALLATION_ID>'
    # $PrivateKey = 'C:\path\to\private-key.pem'

    # Load private key
    # $PrivateKey = Get-Content $PrivateKeyPath -Raw

    # Create JWT header and payload
    $header = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json -InputObject @{
                    alg = 'RS256'
                    typ = 'JWT'
                }))).TrimEnd('=').Replace('+', '-').Replace('/', '_')

    $payload = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json -InputObject @{
                    iat = [System.DateTimeOffset]::UtcNow.AddSeconds(-10).ToUnixTimeSeconds()
                    exp = [System.DateTimeOffset]::UtcNow.AddMinutes(10).ToUnixTimeSeconds()
                    iss = $ApplicationId
                }))).TrimEnd('=').Replace('+', '-').Replace('/', '_')

    Write-Host 'Importing RSA Private Key'
    $RSA = [System.Security.Cryptography.RSA]::Create()
    $RSA.ImportFromPem($PrivateKey)

    $signature = [Convert]::ToBase64String($rsa.SignData([System.Text.Encoding]::UTF8.GetBytes("$header.$payload"), [System.Security.Cryptography.HashAlgorithmName]::SHA256, [System.Security.Cryptography.RSASignaturePadding]::Pkcs1)).TrimEnd('=').Replace('+', '-').Replace('/', '_')
    $jwt = "$header.$payload.$signature"

    Write-Host 'Building JWT'
    $JWT = "$UnsignedToken.$SignatureEncoded"

    Write-Host ('Generated JWT: {0}' -f $JWT.Substring(0, 5))

    Write-Host 'Exhanging JWT for installation token'
    # Exchange JWT for installation token
    $TokenResponse = Invoke-RestMethod -Uri "https://api.github.com/app/installations/$InstallationId/access_tokens" `
        -Method POST `
        -Headers @{ Authorization = "Bearer $JWT"; Accept = 'application/vnd.github+json' }

    Write-Host (ConvertTo-Json $TokenResponse -Depth 3 -Compress)

    Write-Host ('Installation Token: {0}' -f $TokenResponse.token.Substring(0, 5))
    Write-Host "Expires at: $($TokenResponse.expires_at)"

    return $TokenResponse.token
}
