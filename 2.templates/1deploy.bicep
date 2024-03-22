@allowed([
  'norwayeast'
  'westeurope'])
param location string = 'norwayeast'

module app '../1.modules/2app.bicep' = {
 name: 'deploy-app'
 params: {
  location:location
 }
}

@description('Notice that the name of the deployment in the portal is this deploy-storage name. It is not the name of the resource, because its using default values, but you can add the name parameter.')
module storage '../1.modules/1storage.bicep' ={
  name: 'deploy-storage'
  params: {
   location:location
  }
}
