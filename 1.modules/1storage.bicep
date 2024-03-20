@allowed([
  'norwayeast'
  'westeurope'])
param location string = 'norwayeast'

@description('Storage accounts are among the types of resources that cannot have symbols in their names')
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'sasbxtoystorage'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
