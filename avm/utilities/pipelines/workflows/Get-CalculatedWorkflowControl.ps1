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

    $deploymentTestRelevantFiles = $diffFiles | Where-Object {
        $_ -match '(.+\.bicep)|(.+main\.json)'
    }
    $staticTestRelevantFiles = $diffFiles | Where-Object {
        $_ -match '(.+\.md)|(.+[\\|\/]tests[\\|\/].+\.ps1)'
    }

    $calculatedAction = 'runNoTests'
    if ($deploymentTestRelevantFiles.Count -gt 0) {
        $calculatedAction = 'runAllTests'
    } elseif ($staticTestRelevantFiles.Count -gt 0) {
        $calculatedAction = 'runStaticTestsOnly'
    }

    Write-Verbose "Performing calculated action [$calculatedAction] for commit [$Commit]" -Verbose

    return $calculatedAction
}