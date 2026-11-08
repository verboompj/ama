param location string
param tags object

module controlPlaneIdentity 'br/public:avm/res/managed-identity/user-assigned-identity:0.6.0' = {
  name: 'control-plane-identity'
  params: {
    name: 'id-ama-poc-sec-aks'
    location: location
    tags: tags
    enableTelemetry: false
  }
}

module kubeletIdentity 'br/public:avm/res/managed-identity/user-assigned-identity:0.6.0' = {
  name: 'kubelet-identity'
  params: {
    name: 'id-ama-poc-sec-kubelet'
    location: location
    tags: tags
    enableTelemetry: false
    roleAssignments: [
      {
        principalId: controlPlaneIdentity.outputs.principalId
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Managed Identity Operator'
      }
    ]
  }
}

@export()
type ManagedIdentity = {
  resourceId: string
  principalId: string
  clientId: string
}

output controlPlane ManagedIdentity = {
  resourceId: controlPlaneIdentity.outputs.resourceId
  principalId: controlPlaneIdentity.outputs.principalId
  clientId: controlPlaneIdentity.outputs.clientId
}
output kubelet ManagedIdentity = {
  resourceId: kubeletIdentity.outputs.resourceId
  principalId: kubeletIdentity.outputs.principalId
  clientId: kubeletIdentity.outputs.clientId
}
