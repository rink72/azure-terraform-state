targetScope = 'subscription'

@description('Name of the resource group for all resources')
param resourceGroupName string

@description('Name of the Azure Storage Account')
param storageAccountName string

@description('Tags to apply to all resources')
param tags object

@description('Name of the Azure region to deploy all resources')
param location string = 'australiaeast'

@description('Suffix for ARM deployment names')
param deploymentNameSuffix string = utcNow('yyyyMMddhhmmss')

@description('Principals to assign access')
param principals array = []

resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

module storageAccount 'components/storageaccount.bicep' = {
  name: 'storageAccount-${deploymentNameSuffix}'
  scope: resourceGroup
  params: {
    name: storageAccountName
    location: location
    principals: principals
    tags: tags
  }
}
