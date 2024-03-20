metadata description = '''You can test adding another resource module from the azure verified modules bicep registry'''

@allowed([
  'norwayeast'
  'westeurope'])
param location string = 'norwayeast'



@description('Copy paste this section into 2.templates deploy.bicep')
module keyVault 'br/public:avm/res/key-vault/vault:0.4.0' = {
  name: 'deploy-avm-keyvault'
  params: {
    location:location
    name: 'kv-sbx-toy'
  }
}