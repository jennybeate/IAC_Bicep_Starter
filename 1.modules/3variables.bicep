@description('Test deploying this template and changing the parameter to see the different output')
@allowed([
  'nonprod'
  'prod'
])
param environmentType string = 'nonprod'



var _storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var _appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'

output storage_sku string = _storageAccountSkuName
output serverfarm_sku string = _appServicePlanSkuName
