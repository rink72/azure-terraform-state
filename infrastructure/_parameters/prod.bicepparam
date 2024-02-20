using '../deploy.bicep'

var namePrefix = 'rink72tf'

param resourceGroupName = '${namePrefix}-rg'
param storageAccountName = '${namePrefix}sa'

param principals = [
  {
    id: 'f0424dfa-60a3-41b7-a9d0-a67ad7a914dd' // vsstudio-subscription-sp enterprise app object id
    roleId: '/providers/Microsoft.Authorization/roleDefinitions/ba92f5b4-2d11-453d-a403-e96b0029c9fe' // Storage Blob Data Contributor
    type: 'ServicePrincipal'
  }
]

param tags = {
  group: 'terraform'
}
