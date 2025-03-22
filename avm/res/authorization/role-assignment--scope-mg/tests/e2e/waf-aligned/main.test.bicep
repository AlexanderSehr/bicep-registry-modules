targetScope = 'managementGroup'

metadata name = 'WAF-aligned'
metadata description = 'This instance deploys the module in alignment with the best-practices of the Well-Architected Framework.'

// ========== //
// Parameters //
// ========== //

@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-authorization.roleassignments-${serviceShort}-rg'

@description('Optional. The location to deploy resources to.')
param resourceLocation string = deployment().location

@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints.')
param serviceShort string = 'aramgwaf'

@description('Optional. A token to inject into the name of each resource.')
param namePrefix string = '#_namePrefix_#'

@description('Optional. Subscription ID of the subscription to assign the RBAC role to. If no Resource Group name is provided, the module deploys at subscription level, therefore assigns the provided RBAC role to the subscription.')
param subscriptionId string = '#_subscriptionId_#'

// ============ //
// Dependencies //
// ============ //

// General resources
// =================
module resourceGroup 'br/public:avm/res/resources/resource-group:0.4.1' = {
  scope: subscription('${subscriptionId}')
  name: '${uniqueString(deployment().name, resourceLocation)}-resourceGroup'
  params: {
    name: resourceGroupName
    location: resourceLocation
  }
}

module nestedDependencies 'dependencies.bicep' = {
  scope: az.resourceGroup(subscriptionId, resourceGroupName)
  name: '${uniqueString(deployment().name, resourceLocation)}-${serviceShort}-nestedDependencies'
  params: {
    managedIdentityName: 'dep-${namePrefix}-msi-${serviceShort}'
    location: resourceLocation
  }
  dependsOn: [
    resourceGroup
  ]
}

// ============== //
// Test Execution //
// ============== //

@batchSize(1)
module testDeployment '../../../main.bicep' = [
  for iteration in ['init', 'idem']: {
    name: '${uniqueString(deployment().name, resourceLocation)}-test-${serviceShort}-${iteration}'
    params: {
      principalId: nestedDependencies.outputs.managedIdentityPrincipalId
      roleDefinitionIdOrName: 'Resource Policy Contributor'
      principalType: 'ServicePrincipal'
    }
  }
]
