// =========== main.bicep ===========

module stg './resourcegroup.bicep' = {
  name: 'myStgName'
  params: {
    resourceGroup: 'test'
    location: 'westus'
  }
  scope: subscription('00000000-0000-0000-0000-000000000000')
}
