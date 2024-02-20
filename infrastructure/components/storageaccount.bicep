@description('Storage account name')
param name string

@description('Resource tags')
param tags object = {}

@description('Resource location')
param location string = resourceGroup().location

@description('Principals to assign Storage account access')
param principals array = []

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name
  tags: tags
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
    allowSharedKeyAccess: false
  }
}

resource blobContributorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = [for principal in principals: {
  scope: storageAccount
  name: guid(storageAccount.id, principal.id, principal.roleId)
  properties: {
    roleDefinitionId: principal.roleId
    principalId: principal.id
    principalType: principal.type
  }
}]

output storageAccountId string = storageAccount.id
