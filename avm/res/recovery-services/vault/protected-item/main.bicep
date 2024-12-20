metadata name = 'Recovery Service Vaults Protection Container Protected Item'
metadata description = 'This module deploys a Recovery Services Vault Protection Container Protected Item.'
metadata owner = 'Azure/module-maintainers'

@description('Required. Name of the resource.')
param name string

@description('Conditional. Name of the Azure Recovery Service Vault Protection Container. Required if the template is used in a standalone deployment.')
param protectionContainerName string

@description('Conditional. The name of the parent Azure Recovery Service Vault. Required if the template is used in a standalone deployment.')
param recoveryVaultName string

@description('Optional. Location for all resources.')
param location string = resourceGroup().location

@allowed([
  'AzureFileShareProtectedItem'
  'AzureVmWorkloadSAPAseDatabase'
  'AzureVmWorkloadSAPHanaDatabase'
  'AzureVmWorkloadSQLDatabase'
  'DPMProtectedItem'
  'GenericProtectedItem'
  'MabFileFolderProtectedItem'
  'Microsoft.ClassicCompute/virtualMachines'
  'Microsoft.Compute/virtualMachines'
  'Microsoft.Sql/servers/databases'
])
@description('Required. The backup item type.')
param protectedItemType string

@description('Required. Resource ID of the backup policy with which this item is backed up.')
param policyResourceId string

@description('Required. Resource ID of the resource to back up.')
param sourceResourceId string

resource protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2020-02-02' = {
  name: '${recoveryVaultName}/Azure/${protectionContainerName}/${name}'
  location: location
  properties: {
    protectedItemType: any(protectedItemType)
    policyId: policyResourceId
    sourceResourceId: sourceResourceId
  }
}

// resource protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2024-10-01' = {
//   name: 'alsgrsvmax001/Azure/iaasvmcontainer;iaasvmcontainerv2;dep-alsg-recoveryservices.vaults-rsvmax-rg;dep-alsg-vm-rsvmax/vm;iaasvmcontainerv2;dep-alsg-recoveryservices.vaults-rsvmax-rg;dep-alsg-vm-rsvmax'
//   location: location
//   properties: {
//     protectedItemType: 'Microsoft.Compute/virtualMachines'
//     policyId: '/subscriptions/a7439831-1cd9-435d-a091-4aa863c96556/providers/Microsoft.RecoveryServices/vaults/alsgrsvmax001/backupPolicies/VMpolicy'
//     sourceResourceId: '/subscriptions/a7439831-1cd9-435d-a091-4aa863c96556/resourceGroups/dep-alsg-recoveryservices.vaults-rsvmax-rg/providers/Microsoft.Compute/virtualMachines/dep-alsg-vm-rsvmax'
//   }
// }

@description('The name of the Resource Group the protected item was created in.')
output resourceGroupName string = resourceGroup().name

@description('The resource ID of the protected item.')
output resourceId string = protectedItem.id

@description('The Name of the protected item.')
output name string = protectedItem.name
