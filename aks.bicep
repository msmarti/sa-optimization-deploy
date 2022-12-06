// aks.bicep

param location string
param clusterName string

param nodeCount int = 3
param vmSize string = 'Standard_F8s_v2'

resource aks 'Microsoft.ContainerService/managedClusters@2021-05-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: clusterName
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: '${clusterName}f816'
        count: nodeCount
        vmSize: vmSize
        mode: 'System'
      }
    ]
  }
}
