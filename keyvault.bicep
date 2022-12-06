param location string
param keyVaultName string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
  }
    accessPolicies: []
    enableSoftDelete: true
  }
}
