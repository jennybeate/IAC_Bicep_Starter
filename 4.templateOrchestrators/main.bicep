metadata description = '''This main file will deploy all the resources defined directly or indirectly in the template(s) being called'''


@allowed([
  'norwayeast'
  'westeurope'])
param location string = 'norwayeast'


module template '../2.templates/deploy.bicep' = {
  name: 'deploy-template'
  params: {
    location: location
  }
}
