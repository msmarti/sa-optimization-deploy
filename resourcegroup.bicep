// =========== resource-group.bicep ===========

targetScope = 'subscription'    // Resource group must be deployed under 'subscription' scope

param resourceGroupName string
param location string
param prefix string

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
}

module stg './storage.bicep' = {
  name: 'storageDeployment'
  params: {
    storageAccountName: 'st-${prefix}contoso'
    location: location
  }
  scope: rg
}


module aks './aks.bicep' = {
  name: 'aksDeployment'
  params: {
    clusterName: 'aks-${prefix}contoso'
    location: location
  }
  scope: rg
}
