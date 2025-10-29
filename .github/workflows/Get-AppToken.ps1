<#
.SYNOPSIS
Get a GitHub Access (/ installation) token based on a given GitHub application's information

.DESCRIPTION
Get a GitHub Access (/ installation) token based on a given GitHub application's information

.PARAMETER ApplicationId
Mandatory. The Application ID of the application

.PARAMETER InstallationId
Mandatory. The Installation ID of the application

.PARAMETER PrivateKey
The private key of the application in PEM format

.EXAMPLE
Get-AppToken -ApplicationId '12345' -InstallationId '67890' -PrivateKey $pemKey

Get a GitHub Access token for the given application with id '12345' and installation id '67890' using the provided PEM key.
#>
function Get-AppToken {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string] $ApplicationId,

        [Parameter(Mandatory)]
        [string] $InstallationId,

        [Parameter(Mandatory)]
        [string] $PrivateKey
    )

    # Create JWT header and payload
    $header = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json -InputObject @{
                    alg = 'RS256'
                    typ = 'JWT'
                }))).TrimEnd('=').Replace('+', '-').Replace('/', '_')

    $payload = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((ConvertTo-Json -InputObject @{
                    iat = [System.DateTimeOffset]::UtcNow.AddSeconds(-60).ToUnixTimeSeconds()
                    exp = [System.DateTimeOffset]::UtcNow.AddMinutes(10).ToUnixTimeSeconds()
                    iss = $ApplicationId
                }))).TrimEnd('=').Replace('+', '-').Replace('/', '_')

    Write-Verbose 'Importing RSA Key' -Verbose
    $RSA = [System.Security.Cryptography.RSA]::Create()
    $RSA.ImportFromPem($PrivateKey)

    $signature = [Convert]::ToBase64String($rsa.SignData([System.Text.Encoding]::UTF8.GetBytes("$header.$payload"), [System.Security.Cryptography.HashAlgorithmName]::SHA256, [System.Security.Cryptography.RSASignaturePadding]::Pkcs1)).TrimEnd('=').Replace('+', '-').Replace('/', '_')

    Write-Verbose 'Building JWT' -Verbose
    $jwt = "$header.$payload.$signature"

    Write-Verbose 'Exhanging JWT for installation token' -Verbose
    # Exchange JWT for installation token
    $restInputObject = @{
        Uri     = "https://api.github.com/app/installations/$InstallationId/access_tokens"
        Method  = 'POST'
        Headers = @{
            Authorization = "Bearer $jwt"
            Accept        = 'application/vnd.github+json'
        }
    }
    $TokenResponse = Invoke-RestMethod @restInputObject


    if ([String]::IsNullOrEmpty($TokenResponse.token)) {
        throw 'Failed to obtain installation token.'
    }

    Write-Verbose ('Token expires at [{0}]' -f $TokenResponse.expires_at)-Verbose

    return $TokenResponse.token
}
