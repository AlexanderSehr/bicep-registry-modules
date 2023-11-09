<#
.SYNOPSIS
Based on a `git diff`, calculate which stages to run in the pipeline

.DESCRIPTION
Based on a `git diff`, calculate which stages to run in the pipeline
- If any files that justify a deployment test have changed, run all tests (e.g., bicep files, ARM template files)
- Else, if any files that justify a static test have changed, run static tests only (e.g., markdown files, unit test files)
- Else run no tests

.PARAMETER Commit
Mandatory. The commit to compare

.PARAMETER ModulePath
Mandatory. The path to filter changed files down to

.EXAMPLE
Get-CalculatedWorkflowControl -Commit 'e1f088f7f807db040e79e17d28a656d40dbb2cd8' -ModulePath 'avm/res/key-vault/vault'

Calculate which pipeline stages should be run based on the currently changed files.
#>
function Get-CalculatedWorkflowControl {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Commit,

        [Parameter(Mandatory = $true)]
        [string] $ModulePath
    )

    $calculatedAction = 'runNoTests'
    # TODO: What to do with the `Commit param` ?
    if ($diffFiles = git diff 'origin/main' --name-only -- $ModulePath | Sort-Object -Unique) {

        $bicepTemplateRegex = '(.+\.bicep)'
        $jsonTemplateRegex = '(.+main\.json)'
        $markdownRegex = '(.+\.md)'
        $unitTestRegex = '(.+[\\|\/]tests[\\|\/].+\.ps1)'

        $deploymentTestRelevantFiles = $diffFiles | Where-Object {
            $_ -match "$bicepTemplateRegex|$jsonTemplateRegex"
        }
        Write-Verbose ("Changed files that justify deployment tests: `n{0}" -f ($deploymentTestRelevantFiles | ConvertTo-Json)) -Verbose

        $staticTestRelevantFiles = $diffFiles | Where-Object {
            $_ -match "$markdownRegex|$unitTestRegex"
        }
        Write-Verbose ("Changed files that justify static tests: `n{0}" -f ($staticTestRelevantFiles | ConvertTo-Json)) -Verbose


        if ($deploymentTestRelevantFiles.Count -gt 0) {
            $calculatedAction = 'runAllTests'
        } elseif ($staticTestRelevantFiles.Count -gt 0) {
            $calculatedAction = 'runStaticTestsOnly'
        }
    }
    Write-Verbose "Performing calculated action [$calculatedAction] for commit [$Commit]" -Verbose

    return $calculatedAction
}
# Get-CalculatedWorkflowControl -Commit 'e1f088f7f807db040e79e17d28a656d40dbb2cd8' -ModulePath 'avm/res/key-vault/vault'