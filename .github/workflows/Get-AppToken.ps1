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
    $Header = @{ alg = 'RS256'; typ = 'JWT' }
    $Payload = @{
        iat = [int][double]::Parse((Get-Date -UFormat %s))       # Issued at
        exp = [int][double]::Parse((Get-Date).AddMinutes(10).ToUniversalTime().ToString('u') -replace '\D') # Expiration
        iss = $AppId                                              # GitHub App ID
    }

    # Convert to Base64Url
    function ConvertTo-Base64Url($input) {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($input)
        $base64 = [Convert]::ToBase64String($bytes)
        return $base64.TrimEnd('=').Replace('+', '-').Replace('/', '_')
    }

    $HeaderEncoded = ConvertTo-Base64Url((ConvertTo-Json $Header -Compress))
    $PayloadEncoded = ConvertTo-Base64Url((ConvertTo-Json $Payload -Compress))
    $UnsignedToken = "$HeaderEncoded.$PayloadEncoded"

    # Sign JWT using RS256
    $RSA = [System.Security.Cryptography.RSA]::Create()
    $RSA.ImportFromPem($PrivateKey)
    $SignatureBytes = $RSA.SignData([System.Text.Encoding]::UTF8.GetBytes($UnsignedToken), [System.Security.Cryptography.HashAlgorithmName]::SHA256, [System.Security.Cryptography.RSASignaturePadding]::Pkcs1)
    $SignatureEncoded = [Convert]::ToBase64String($SignatureBytes).TrimEnd('=').Replace('+', '-').Replace('/', '_')

    $JWT = "$UnsignedToken.$SignatureEncoded"

    Write-Host ('Generated JWT: {0}' -f $JWT.Substring(0, 5))

    # Exchange JWT for installation token
    $TokenResponse = Invoke-RestMethod -Uri "https://api.github.com/app/installations/$InstallationId/access_tokens" `
        -Method POST `
        -Headers @{ Authorization = "Bearer $JWT"; Accept = 'application/vnd.github+json' }

    Write-Host ('Installation Token: {0}' -f $TokenResponse.token.Substring(0, 5))
    Write-Host "Expires at: $($TokenResponse.expires_at)"

    return %$TokenResponse.token
}
