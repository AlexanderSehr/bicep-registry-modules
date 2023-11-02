function Get-CalculatedWorkflowControl {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Commit,

        [Parameter(Mandatory = $true)]
        [string] $ModulePath
    )

    $diffFiles = git diff 'origin/main' --name-only -- $ModulePath | Sort-Object -Unique

    if (-not $diffFiles) {
        Write-Verbose "No files changed in $ModulePath" -Verbose
        return
    }

    return $diffFiles
}