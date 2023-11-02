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
        Write-Verbose "No files changed in path [$ModulePath]" -Verbose
        return ''
    }

    # TODO filter
    # - If only readme files -> static validation
    # - If bicep files -> deployment validation

    return $diffFiles
}