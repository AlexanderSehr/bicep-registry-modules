metadata name = 'Recovery Services Vault Protection Container'
metadata description = 'This module deploys a Recovery Services Vault Protection Container.'
metadata owner = 'Azure/module-maintainers'

@description('Conditional. The name of the parent Azure Recovery Service Vault. Required if the template is used in a standalone deployment.')
param recoveryVaultName string

@description('Required. Name of the Azure Recovery Service Vault Protection Container.')
param name string

@description('Optional. Location for all resources.')
param location string = resourceGroup().location

@description('Optional. Backup management type to execute the current Protection Container job.')
@allowed([
  'AzureBackupServer'
  'AzureIaasVM'
  'AzureSql'
  'AzureStorage'
  'AzureWorkload'
  'DPM'
  'DefaultBackup'
  'Invalid'
  'MAB'
])
param backupManagementType string?

@description('Optional. Resource ID of the target resource for the Protection Container.')
param sourceResourceId string?

@description('Optional. Friendly name of the Protection Container.')
param friendlyName string?

@description('Optional. Protected items to register in the container.')
param protectedItems protectedItemType[]?

@description('Optional. Type of the container.')
@allowed([
  'AzureBackupServerContainer'
  'AzureSqlContainer'
  'GenericContainer'
  'Microsoft.ClassicCompute/virtualMachines'
  'Microsoft.Compute/virtualMachines'
  'SQLAGWorkLoadContainer'
  'StorageContainer'
  'VMAppContainer'
  'Windows'
])
param containerType string?

resource protectionContainer 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers@2024-10-01' = {
  name: '${recoveryVaultName}/Azure/${name}'
  properties: {
    sourceResourceId: sourceResourceId
    friendlyName: friendlyName
    backupManagementType: backupManagementType
    containerType: any(containerType)
  }
}

module protectionContainer_protectedItems 'protected-item/main.bicep' = [
  for (protectedItem, index) in (protectedItems ?? []): {
    name: '${uniqueString(deployment().name, location)}-ProtectedItem-${index}'
    params: {
      policyResourceId: protectedItem.policyResourceId
      name: protectedItem.name
      protectedItemType: protectedItem.protectedItemType
      protectionContainerName: last(split(protectionContainer.name, '/'))
      recoveryVaultName: recoveryVaultName
      sourceResourceId: protectedItem.sourceResourceId
      location: location
    }
  }
]

@description('The name of the Resource Group the Protection Container was created in.')
output resourceGroupName string = resourceGroup().name

@description('The resource ID of the Protection Container.')
output resourceId string = protectionContainer.id

@description('The Name of the Protection Container.')
output name string = protectionContainer.name

@export()
@description('The type for a protected item')
type protectedItemType = {
  @description('Required. Name of the resource.')
  name: string

  @description('Optional. Location for all resources.')
  location: string?

  @description('Required. The backup item type.')
  protectedItemType: (
    | 'AzureFileShareProtectedItem'
    | 'AzureVmWorkloadSAPAseDatabase'
    | 'AzureVmWorkloadSAPHanaDBInstance'
    | 'AzureVmWorkloadSAPHanaDatabase'
    | 'AzureVmWorkloadSQLDatabase'
    | 'DPMProtectedItem'
    | 'GenericProtectedItem'
    | 'MabFileFolderProtectedItem'
    | 'Microsoft.ClassicCompute/virtualMachines'
    | 'Microsoft.Compute/virtualMachines'
    | 'Microsoft.Sql/servers/databases')

  @description('Required. Resource ID of the backup policy with which this item is backed up.')
  policyResourceId: string

  @description('Required. Resource ID of the resource to back up.')
  sourceResourceId: string
}
