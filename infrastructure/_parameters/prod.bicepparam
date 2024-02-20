using '../deploy.bicep'

var namePrefix = 'rink72tf'

param resourceGroupName = '${namePrefix}-rg'
param storageAccountName = '${namePrefix}sa'

param principals = []

param tags = {
  group: 'terraform'
}
