metadata description = '''Usually we want to just have one resource pr module, but this is just a demo.
The app service depends on the app service plan. The main point here is dependencies: creating resources in the right order
and using outputs when they depend on each other. (There are different ways of doing this). The second resource needs the resource ID, so we reference it using dotnotation. 
Test seeing what kind of properties you can output by using dotnotation with the bicep cli extension installed.
This makes the app creation happen after its dependency, and not before, and is the preferred way to declare dependencies.'''


@allowed([
  'norwayeast'
  'westeurope'])
param location string = 'norwayeast'

@description('Click the light bulb icon when hovering over the parameter to test adding different things, like allowed and description')
param appServiceAppName string = 'unique-name-toy-product-launch-app'


@description('''Variables are usually used when you are using a value multiple times. Here, I am just showing how to create and use it. If I wanted, I could
ensure that all the cases were lowercase, without spaces, or are unique, as deployment names should be. You will see the name of individual deployments in the portal''')
var _appServicePlanName = 'toy-product-launch-plan'




resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: _appServicePlanName
  location: location
  sku: {
    name: 'F1'
  }
}

@description('You will use the symbolic name `appServicePlan` when you refer to the module outputs in other parts of the template.')
resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
