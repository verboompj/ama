param clusterId string
param operatorPrincipalId string
param observerPrincipalId string
param operatorPrincipalType 'User' | 'Group'
param observerPrincipalType 'User' | 'Group'

resource cluster 'Microsoft.ContainerService/managedClusters@2026-03-01' existing = {
  name: last(split(clusterId, '/'))
}
var principals = toLower(operatorPrincipalId) == toLower(observerPrincipalId)
  ? [{ id: toLower(operatorPrincipalId), type: operatorPrincipalType }]
  : [
      { id: toLower(operatorPrincipalId), type: operatorPrincipalType }
      { id: toLower(observerPrincipalId), type: observerPrincipalType }
    ]
var roles = ['4abbcc35-e782-43d8-92c5-2d3f1bd2253f', '7f6c6a51-bcf8-42ba-9220-52d62157d7db']
var grants = flatten(map(principals, principal => map(roles, role => {
  principal: principal
  role: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', role)
})))

resource assignments 'Microsoft.Authorization/roleAssignments@2022-04-01' = [for grant in grants: {
  scope: cluster
  name: guid(toLower(cluster.id), grant.principal.id, toLower(grant.role))
  properties: {
    roleDefinitionId: grant.role
    principalId: grant.principal.id
    principalType: grant.principal.type
  }
}]
output roleAssignmentIds string[] = [for (grant, i) in grants: assignments[i].id]
