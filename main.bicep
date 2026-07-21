param location string = resourceGroup().location
@minLength(3)
@maxLength(11)
param storagePrefix string = 'cicd'
var storageName = '${storagePrefix}${uniqueString(resourceGroup().id)}'

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  tags: { demo: 'oidc' }
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
}
output storageName string = sa.name
