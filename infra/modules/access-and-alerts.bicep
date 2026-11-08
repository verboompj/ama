targetScope = 'subscription'

param platformRgName string
param aksRgName string
param clusterId string
param workspaceResourceId string
param actionGroupId string
param operatorPrincipalId string
param observerPrincipalId string
param operatorPrincipalType 'User' | 'Group'
param observerPrincipalType 'User' | 'Group'
param location string
param tags object

module access './cluster-access.bicep' = {
  name: 'cluster-access'
  scope: resourceGroup(aksRgName)
  params: {
    clusterId: clusterId
    operatorPrincipalId: operatorPrincipalId
    observerPrincipalId: observerPrincipalId
    operatorPrincipalType: operatorPrincipalType
    observerPrincipalType: observerPrincipalType
  }
}
module alerts './platform-alerts.bicep' = {
  name: 'platform-alerts'
  scope: resourceGroup(platformRgName)
  params: {
    clusterId: clusterId
    workspaceResourceId: workspaceResourceId
    actionGroupId: actionGroupId
    platformRgId: subscriptionResourceId('Microsoft.Resources/resourceGroups', platformRgName)
    aksRgId: subscriptionResourceId('Microsoft.Resources/resourceGroups', aksRgName)
    location: location
    tags: tags
  }
}
output roleAssignmentIds string[] = access.outputs.roleAssignmentIds
output alertIds string[] = alerts.outputs.alertIds
