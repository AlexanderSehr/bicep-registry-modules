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
        # [Parameter(Mandatory = $true)]
        # [string] $Commit,

        [Parameter(Mandatory = $true)]
        [string] $ModulePath,

        [Parameter(Mandatory = $true)]
        [string] $GitHubEvent,

        [Parameter(Mandatory = $false)]
        [hashtable] $WorkflowParameters,

        [Parameter(Mandatory = $true)]
        [string] $WorkflowPath,

        [Parameter(Mandatory = $false)]
        [string] $RepoRoot = (Get-Item $PSScriptRoot).Parent.Parent.Parent.Parent.FullName
    )

    begin {
        # Loading helper function
        . (Join-Path $repoRoot 'avm' 'utilities' 'pipelines' 'workflows' 'Get-CalculatedWorkflowControl.ps1')
    }

    process {


        # CASE 1 Workflow Dispatch
        # ========================
        if ($GitHubEvent -eq 'workflow_dispatch') {
            Write-Verbose 'Workflow parameters' -Verbose
            Write-Verbose ($WorkflowParameters | ConvertTo-Json) -Verbose

            # TODO: Candle cases
            $calculatedAction = 'runAllTests'
            return


        } else {
            # CASE 2 - Literally anything else
            # ================================
            if ($GitHubEvent -ne 'workflow_dispatch') {
                $workflowParameters = Get-GitHubWorkflowDefaultInput -WorkflowPath $WorkflowPaths
            }

            Write-Verbose "The workflow trigger is [$GitHubEvent]" -Verbose

            # TODO: What to do with the `Commit param` ?

            if ((git branch --show-current) -eq 'main') {
                # If already in main, we'd want to compare with the previous commit
                $diffFiles = git diff HEAD^ --name-only -- $ModulePath | Sort-Object -Unique
            } else {
                # If in a branch, we'd want to compare with main
                $diffFiles = git diff 'origin/main' --name-only -- $ModulePath | Sort-Object -Unique
            }

            $calculatedAction = 'runAllTests'
            if ($diffFiles) {

                # Alternative:
                # - Deployment test is default OR
                # - If only markdown or tests/*.ps1 changed we run static tests

                # Also: Move the workflow dispatch logic also here to do all the calculation here

                $bicepTemplateRegex = '(.+\.bicep)'
                $jsonTemplateRegex = '(.+main\.json)'
                $markdownRegex = '(.+\.md)'
                $unitTestRegex = '(.+[\\|\/]tests[\\|\/]unit[\\|\/].*)'

                $deploymentTestRelevantFiles = $diffFiles | Where-Object {
                    $_ -match "$bicepTemplateRegex|$jsonTemplateRegex"
                }
                Write-Verbose ("Changed files that justify deployment tests: `n{0}" -f ($deploymentTestRelevantFiles | ConvertTo-Json)) -Verbose

                $staticTestRelevantFiles = $diffFiles | Where-Object {
                    $_ -match "$markdownRegex|$unitTestRegex"
                }
                Write-Verbose ("Changed files that justify static tests: `n{0}" -f ($staticTestRelevantFiles | ConvertTo-Json)) -Verbose

                if ($deploymentTestRelevantFiles.Count -eq 0 -and $staticTestRelevantFiles.Count -gt 0) {
                    $calculatedAction = 'runStaticTestsOnly'
                }
            }
            Write-Verbose "Performing calculated action [$calculatedAction] for commit [$Commit]" -Verbose

            return $calculatedAction
        }
    }
}

# $inputObject = @{
#     Commit       = 'e1f088f7f807db040e79e17d28a656d40dbb2cd8'
#     ModulePath   = 'avm/res/key-vault/vault'
#     GitHubEvent  = 'push'
#     WorkflowPath = 'C:\dev\ip\Azure-bicep-registry-modules\alexanderSehr-fork\.github\workflows\avm.res.key-vault.vault.yml'
# }
# Get-CalculatedWorkflowControl @inputObject