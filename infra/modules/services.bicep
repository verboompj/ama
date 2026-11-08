param location string
param tags object
param tenantId string
param peSubnetId string
param acrZoneId string
param vaultZoneId string
param kubeletPrincipalId string
param workspaceResourceId string

module registry 'br/public:avm/res/container-registry/registry:0.13.1' = {
  name: 'registry'
  params: {
    name: 'acramapocsec001'
    location: location
    tags: tags
    enableTelemetry: false
    acrSku: 'Premium'
    roleAssignmentMode: 'LegacyRegistryPermissions'
    acrAdminUserEnabled: false
    anonymousPullEnabled: false
    publicNetworkAccess: 'Disabled'
    networkRuleBypassOptions: 'None'
    networkRuleSetDefaultAction: 'Deny'
    networkRuleSetIpRules: []
    dataEndpointEnabled: true
    retentionPolicyStatus: 'disabled'
    zoneRedundancy: 'Disabled'
    exportPolicyStatus: 'disabled'
    quarantinePolicyStatus: 'disabled'
    trustPolicyStatus: 'disabled'
    softDeletePolicyStatus: 'disabled'
    roleAssignments: [
      {
        principalId: kubeletPrincipalId
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'AcrPull'
      }
    ]
    diagnosticSettings: [
      {
        name: 'diag-ama-poc-sec-acr'
        workspaceResourceId: workspaceResourceId
        logAnalyticsDestinationType: 'Dedicated'
        logCategoriesAndGroups: [
          { category: 'ContainerRegistryLoginEvents' }
          { category: 'ContainerRegistryRepositoryEvents' }
        ]
        metricCategories: []
      }
    ]
  }
}

module vault 'br/public:avm/res/key-vault/vault:0.14.2' = {
  name: 'vault'
  params: {
    name: 'kv-ama-poc-sec-001'
    location: location
    tags: tags
    enableTelemetry: false
    sku: 'standard'
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    enablePurgeProtection: true
    enableVaultForDeployment: false
    enableVaultForTemplateDeployment: false
    enableVaultForDiskEncryption: false
    publicNetworkAccess: 'Disabled'
    networkAcls: {
      bypass: 'None'
      defaultAction: 'Deny'
      ipRules: []
      virtualNetworkRules: []
    }
    diagnosticSettings: [
      {
        name: 'diag-ama-poc-sec-kv'
        workspaceResourceId: workspaceResourceId
        logAnalyticsDestinationType: 'Dedicated'
        logCategoriesAndGroups: [{ category: 'AuditEvent' }]
        metricCategories: []
      }
    ]
  }
}

// The published vault owns tenantId from subscription().tenantId.
// The explicit input is checked against root context before any Azure execution.
output expectedTenantId string = tenantId

module registryEndpoint 'br/public:avm/res/network/private-endpoint:0.12.1' = {
  name: 'registry-endpoint'
  params: {
    name: 'pe-ama-poc-sec-acr'
    location: location
    tags: tags
    enableTelemetry: false
    subnetResourceId: peSubnetId
    privateLinkServiceConnections: [
      {
        name: 'registry'
        properties: {
          privateLinkServiceId: registry.outputs.resourceId
          groupIds: ['registry']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'default'
      privateDnsZoneGroupConfigs: [{ name: 'registry', privateDnsZoneResourceId: acrZoneId }]
    }
  }
}

module vaultEndpoint 'br/public:avm/res/network/private-endpoint:0.12.1' = {
  name: 'vault-endpoint'
  params: {
    name: 'pe-ama-poc-sec-kv'
    location: location
    tags: tags
    enableTelemetry: false
    subnetResourceId: peSubnetId
    privateLinkServiceConnections: [
      {
        name: 'vault'
        properties: {
          privateLinkServiceId: vault.outputs.resourceId
          groupIds: ['vault']
        }
      }
    ]
    privateDnsZoneGroup: {
      name: 'default'
      privateDnsZoneGroupConfigs: [{ name: 'vault', privateDnsZoneResourceId: vaultZoneId }]
    }
  }
}

output registryId string = registry.outputs.resourceId
output loginServer string = registry.outputs.loginServer
output vaultId string = vault.outputs.resourceId
output vaultUri string = vault.outputs.uri
output privateEndpointIds string[] = [registryEndpoint.outputs.resourceId, vaultEndpoint.outputs.resourceId]
