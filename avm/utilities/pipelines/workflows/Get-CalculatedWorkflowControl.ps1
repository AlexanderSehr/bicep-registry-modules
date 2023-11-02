function Get-CalculatedWorkflowControl {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Commit,

        [Parameter(Mandatory = $true)]
        [string] $ModulePath
    )

    $calculatedAction = 'runNoTests'
    if ($diffFiles = git diff 'origin/main' --name-only -- $ModulePath | Sort-Object -Unique) {

        $bicepTemplateRegex = '(.+\.bicep)'
        $jsonTemplateRegex = '(.+main\.json)'
        $markdownRegex = '(.+\.md)'
        $unitTestRegex = '(.+[\\|\/]tests[\\|\/].+\.ps1)'

        $deploymentTestRelevantFiles = $diffFiles | Where-Object {
            $_ -match "$bicepTemplateRegex|$jsonTemplateRegex"
        }
        Write-Verbose ("Changed files that justify deployment tests: `n[{0}]" -f ($deploymentTestRelevantFiles | ConvertTo-Json)) -Verbose

        $staticTestRelevantFiles = $diffFiles | Where-Object {
            $_ -match "$markdownRegex|$unitTestRegex"
        }
        Write-Verbose ("Changed files that justify static tests: `n[{0}]" -f ($staticTestRelevantFiles | ConvertTo-Json)) -Verbose


        if ($deploymentTestRelevantFiles.Count -gt 0) {
            $calculatedAction = 'runAllTests'
        } elseif ($staticTestRelevantFiles.Count -gt 0) {
            $calculatedAction = 'runStaticTestsOnly'
        }
    }
    Write-Verbose "Performing calculated action [$calculatedAction] for commit [$Commit]" -Verbose

    return $calculatedAction
}