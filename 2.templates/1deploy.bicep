@allowed([
  'norwayeast'
  'westeurope'])
param location string = 'norwayeast'

module app '../1.modules/2app.bicep' = {
 name: 'deploy app'
 params: {
  location:location
 }
}

module storage '../1.modules/1storage.bicep' ={
  name: 'deploy storage'
  params: {
   location:location
  }
}
