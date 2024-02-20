using '../deploy.bicep'

var namePrefix = 'rink72tf'

param resourceGroupName = '${namePrefix}-rg'
param storageAccountName = '${namePrefix}sa'

param principals = [
  {
    id: 'ddc0a372-d311-4a8b-8369-815fec7eb992' // vsstudio-subscription-sp
    roleId: '/providers/Microsoft.Authorization/roleDefinitions/ba92f5b4-2d11-453d-a403-e96b0029c9fe' // Storage Blob Data Contributor
    type: 'ServicePrincipal'
  }
]

param tags = {
  group: 'terraform'
}
