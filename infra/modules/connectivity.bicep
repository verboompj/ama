@export()
type AddressPlan = {
  vnetCidr: string
  systemSubnetCidr: string
  userSubnetCidr: string
  ingressSubnetCidr: string
  privateEndpointsSubnetCidr: string
  dnsInboundSubnetCidr: string
  gatewaySubnetCidr: string
  firewallSubnetCidr: string
  podCidr: string
  serviceCidr: string
  dnsServiceIp: string
  vpnClientCidr: string
  dnsInboundConfiguredIp: string
}
@export()
type SubnetIds = {
  system: string
  user: string
  ingress: string
  privateEndpoints: string
  dnsInbound: string
  gateway: string
  firewall: string
}
@export()
type ZoneIds = { aks: string, acr: string, vault: string }
@export()
type VpnRoot = { name: string, publicCertData: string }
@export()
type RevokedClient = { name: string, thumbprint: string }

param location string
param tags object
param controlPlanePrincipalId string
param workspaceResourceId string
param addressPlan AddressPlan
@minLength(1)
param vpnRoots VpnRoot[]
param vpnRevokedClients RevokedClient[]

module vnet 'br/public:avm/res/network/virtual-network:0.10.2' = {
  name: 'virtual-network'
  params: {
    name: 'vnet-ama-poc-sec'
    location: location
    tags: tags
    enableTelemetry: false
    addressPrefixes: [addressPlan.vnetCidr]
    roleAssignments: [
      {
        principalId: controlPlanePrincipalId
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Network Contributor'
      }
    ]
  }
}

var nsgNames = ['system', 'user', 'ingress']
module nsgs 'br/public:avm/res/network/network-security-group:0.5.4' = [for suffix in nsgNames: {
  name: 'nsg-${suffix}'
  params: {
    name: 'nsg-ama-poc-sec-${suffix}'
    location: location
    tags: tags
    enableTelemetry: false
    flushConnection: false
    securityRules: suffix == 'ingress' ? [
      {
        name: 'allow-vpn-https'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourceAddressPrefix: addressPlan.vpnClientCidr
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '443'
        }
      }
      {
        name: 'deny-other-inbound'
        properties: {
          priority: 4000
          direction: 'Inbound'
          access: 'Deny'
          protocol: '*'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '*'
        }
      }
    ] : [
      {
        name: 'deny-ssh'
        properties: {
          priority: 4000
          direction: 'Inbound'
          access: 'Deny'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}]

var pipNames = ['fw', 'nat', 'vpn']
module publicIps 'br/public:avm/res/network/public-ip-address:0.13.0' = [for suffix in pipNames: {
  name: 'pip-${suffix}'
  params: {
    name: 'pip-ama-poc-sec-${suffix}'
    location: location
    tags: tags
    enableTelemetry: false
    skuName: 'Standard'
    skuTier: 'Regional'
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    availabilityZones: suffix == 'vpn' ? [1, 2, 3] : [1]
  }
}]
module nat 'br/public:avm/res/network/nat-gateway:2.1.1' = {
  name: 'nat-gateway'
  params: {
    name: 'nat-ama-poc-sec'
    location: location
    tags: tags
    enableTelemetry: false
    natGatewaySku: 'Standard'
    availabilityZone: 1
    idleTimeoutInMinutes: 5
    publicIpResourceIds: [publicIps[1].outputs.resourceId]
  }
}

var earlySubnets = [
  { name: 'snet-ingress', cidr: addressPlan.ingressSubnetCidr, nsg: nsgs[2].outputs.resourceId, nat: null, delegation: null, pePolicies: null }
  { name: 'snet-private-endpoints', cidr: addressPlan.privateEndpointsSubnetCidr, nsg: null, nat: null, delegation: null, pePolicies: 'Disabled' }
  { name: 'snet-dns-inbound', cidr: addressPlan.dnsInboundSubnetCidr, nsg: null, nat: null, delegation: 'Microsoft.Network/dnsResolvers', pePolicies: null }
  { name: 'GatewaySubnet', cidr: addressPlan.gatewaySubnetCidr, nsg: null, nat: null, delegation: null, pePolicies: null }
  { name: 'AzureFirewallSubnet', cidr: addressPlan.firewallSubnetCidr, nsg: null, nat: nat.outputs.resourceId, delegation: null, pePolicies: null }
]
module earlySubnetModules 'br/public:avm/res/network/virtual-network/subnet:0.2.0' = [for i in range(0, 5): {
  name: 'subnet-early-${i}'
  params: {
    name: earlySubnets[i].name
    virtualNetworkName: vnet.outputs.name
    addressPrefix: earlySubnets[i].cidr
    networkSecurityGroupResourceId: earlySubnets[i].nsg
    natGatewayResourceId: earlySubnets[i].nat
    delegation: earlySubnets[i].delegation
    privateEndpointNetworkPolicies: earlySubnets[i].pePolicies
    enableTelemetry: false
  }
}]

var zones = ['privatelink.swedencentral.azmk8s.io', 'privatelink.azurecr.io', 'privatelink.vaultcore.azure.net']
module privateZones 'br/public:avm/res/network/private-dns-zone:0.8.1' = [for (zone, i) in zones: {
  name: 'private-zone-${i}'
  params: {
    name: zone
    location: 'global'
    tags: tags
    enableTelemetry: false
    virtualNetworkLinks: [
      { name: 'link-ama-poc-sec', virtualNetworkResourceId: vnet.outputs.resourceId, registrationEnabled: false }
    ]
    roleAssignments: i == 0 ? [
      {
        principalId: controlPlanePrincipalId
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Private DNS Zone Contributor'
      }
    ] : []
  }
}]

var sources = [addressPlan.systemSubnetCidr, addressPlan.userSubnetCidr]
var https = [{ protocolType: 'Https', port: 443 }]
module firewallPolicy 'br/public:avm/res/network/firewall-policy:0.3.6' = {
  name: 'firewall-policy'
  params: {
    name: 'afwp-ama-poc-sec'
    location: location
    tags: tags
    enableTelemetry: false
    tier: 'Standard'
    enableProxy: false
    insightsIsEnabled: false
    threatIntelMode: 'Deny'
    ruleCollectionGroups: [
      {
        name: 'rcg-ama-poc-sec-aks'
        priority: 200
        ruleCollections: [
          {
            name: 'monitor-network'
            priority: 100
            ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
            action: { type: 'Allow' }
            rules: [
              {
                name: 'azure-monitor'
                ruleType: 'NetworkRule'
                sourceAddresses: sources
                destinationAddresses: ['AzureMonitor']
                destinationPorts: ['443']
                ipProtocols: ['TCP']
              }
            ]
          }
          {
            name: 'aks-platform'
            priority: 200
            ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
            action: { type: 'Allow' }
            rules: [
              { name: 'aks', ruleType: 'ApplicationRule', sourceAddresses: sources, fqdnTags: ['AzureKubernetesService'], protocols: https }
            ]
          }
          {
            name: 'aks-explicit'
            priority: 210
            ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
            action: { type: 'Allow' }
            rules: [
              {
                name: 'aks-dependencies'
                ruleType: 'ApplicationRule'
                sourceAddresses: sources
                protocols: https
                targetFqdns: [
                  'mcr.microsoft.com'
                  '*.data.mcr.microsoft.com'
                  'mcr-0001.mcr-msedge.net'
                  'management.azure.com'
                  'login.microsoftonline.com'
                  'packages.microsoft.com'
                  'acs-mirror.azureedge.net'
                  'packages.aks.azure.com'
                ]
              }
            ]
          }
          {
            name: 'monitor-explicit'
            priority: 220
            ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
            action: { type: 'Allow' }
            rules: [
              {
                name: 'monitor-dependencies'
                ruleType: 'ApplicationRule'
                sourceAddresses: sources
                protocols: https
                targetFqdns: [
                  '*.ods.opinsights.azure.com'
                  '*.oms.opinsights.azure.com'
                  'dc.services.visualstudio.com'
                  '*.monitoring.azure.com'
                  'global.handler.control.monitor.azure.com'
                  'swedencentral.handler.control.monitor.azure.com'
                  '*.ingest.monitor.azure.com'
                ]
              }
            ]
          }
        ]
      }
    ]
  }
}
module firewall 'br/public:avm/res/network/azure-firewall:0.11.1' = {
  name: 'firewall'
  params: {
    name: 'afw-ama-poc-sec'
    location: location
    tags: tags
    enableTelemetry: false
    azureSkuTier: 'Standard'
    availabilityZones: [1]
    virtualNetworkResourceId: vnet.outputs.resourceId
    publicIPResourceID: publicIps[0].outputs.resourceId
    firewallPolicyId: firewallPolicy.outputs.resourceId
    enableManagementNic: false
    diagnosticSettings: [
      {
        name: 'diag-ama-poc-sec-fw'
        workspaceResourceId: workspaceResourceId
        logAnalyticsDestinationType: 'AzureDiagnostics'
        logCategoriesAndGroups: [
          { category: 'AzureFirewallApplicationRule' }
          { category: 'AzureFirewallNetworkRule' }
        ]
        metricCategories: []
      }
    ]
  }
  // The AVM derives this subnet ID; an explicit dependency waits for its owner.
  dependsOn: [earlySubnetModules]
}
module routeTable 'br/public:avm/res/network/route-table:0.5.0' = {
  name: 'node-route-table'
  params: {
    name: 'rt-ama-poc-sec-aks'
    location: location
    tags: tags
    enableTelemetry: false
    disableBgpRoutePropagation: false
    routes: [
      { name: 'default-egress', properties: { addressPrefix: '0.0.0.0/0', nextHopType: 'VirtualAppliance', nextHopIpAddress: firewall.outputs.privateIp } }
    ]
  }
}
var nodeSubnets = [
  { name: 'snet-aks-system', cidr: addressPlan.systemSubnetCidr, nsg: nsgs[0].outputs.resourceId }
  { name: 'snet-aks-user', cidr: addressPlan.userSubnetCidr, nsg: nsgs[1].outputs.resourceId }
]
module nodeSubnetModules 'br/public:avm/res/network/virtual-network/subnet:0.2.0' = [for i in range(0, 2): {
  name: 'subnet-node-${i}'
  params: {
    name: nodeSubnets[i].name
    virtualNetworkName: vnet.outputs.name
    addressPrefix: nodeSubnets[i].cidr
    networkSecurityGroupResourceId: nodeSubnets[i].nsg
    routeTableResourceId: routeTable.outputs.resourceId
    defaultOutboundAccess: false
    enableTelemetry: false
  }
}]

module resolver 'br/public:avm/res/network/dns-resolver:0.5.8' = {
  name: 'dns-resolver'
  params: {
    name: 'dnspr-ama-poc-sec'
    location: location
    tags: tags
    enableTelemetry: false
    virtualNetworkResourceId: vnet.outputs.resourceId
    inboundEndpoints: [
      {
        name: 'inbound'
        subnetResourceId: earlySubnetModules[2].outputs.resourceId
        privateIpAllocationMethod: 'Static'
        privateIpAddress: addressPlan.dnsInboundConfiguredIp
        tags: tags
      }
    ]
    outboundEndpoints: []
  }
}
resource vpn 'Microsoft.Network/virtualNetworkGateways@2025-01-01' = {
  name: 'vgw-ama-poc-sec'
  location: location
  tags: tags
  properties: {
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    vpnGatewayGeneration: 'Generation1'
    sku: { name: 'VpnGw1AZ', tier: 'VpnGw1AZ' }
    activeActive: false
    enableBgp: false
    disableIPSecReplayProtection: false
    allowVirtualWanTraffic: false
    allowRemoteVnetTraffic: false
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: { id: earlySubnetModules[3].outputs.resourceId }
          publicIPAddress: { id: publicIps[2].outputs.resourceId }
        }
      }
    ]
    vpnClientConfiguration: {
      vpnClientAddressPool: { addressPrefixes: [addressPlan.vpnClientCidr] }
      vpnClientProtocols: ['OpenVPN']
      vpnAuthenticationTypes: ['Certificate']
      vpnClientRootCertificates: [for root in vpnRoots: {
        name: root.name
        properties: { publicCertData: root.publicCertData }
      }]
      vpnClientRevokedCertificates: [for client in vpnRevokedClients: {
        name: client.name
        properties: { thumbprint: client.thumbprint }
      }]
    }
  }
}
resource vpnDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  scope: vpn
  name: 'diag-ama-poc-sec-vpn'
  properties: {
    workspaceId: workspaceResourceId
    logAnalyticsDestinationType: 'AzureDiagnostics'
    logs: [
      { category: 'GatewayDiagnosticLog', enabled: true }
      { category: 'P2SDiagnosticLog', enabled: true }
    ]
    metrics: []
  }
}

output vnetId string = vnet.outputs.resourceId
output subnetIds SubnetIds = {
  system: nodeSubnetModules[0].outputs.resourceId
  user: nodeSubnetModules[1].outputs.resourceId
  ingress: earlySubnetModules[0].outputs.resourceId
  privateEndpoints: earlySubnetModules[1].outputs.resourceId
  dnsInbound: earlySubnetModules[2].outputs.resourceId
  gateway: earlySubnetModules[3].outputs.resourceId
  firewall: earlySubnetModules[4].outputs.resourceId
}
output zoneIds ZoneIds = { aks: privateZones[0].outputs.resourceId, acr: privateZones[1].outputs.resourceId, vault: privateZones[2].outputs.resourceId }
output firewallPrivateIp string = firewall.outputs.privateIp
output natPublicIp string = publicIps[1].outputs.ipAddress
output vpnGatewayId string = vpn.id
output vpnPublicIp string = publicIps[2].outputs.ipAddress
output dnsResolverId string = resolver.outputs.resourceId
output dnsInboundConfiguredIp string = addressPlan.dnsInboundConfiguredIp
