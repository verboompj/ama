targetScope = 'subscription'

import { AddressPlan, SubnetIds, ZoneIds, VpnRoot, RevokedClient } from './modules/connectivity.bicep'
import { ManagedIdentity } from './modules/identities.bicep'

@allowed(['swedencentral'])
param location string = 'swedencentral'
@allowed(['1.36.4'])
param kubernetesVersion string = '1.36.4'
@minLength(36)
@maxLength(36)
param tenantId string
@minLength(36)
@maxLength(36)
param operatorPrincipalId string
@minLength(36)
@maxLength(36)
param observerPrincipalId string
param operatorPrincipalType 'User' | 'Group'
param observerPrincipalType 'User' | 'Group'
param sshPublicKey string
param alertEmail string
@minLength(1)
param vpnRoots VpnRoot[]
param vpnRevokedClients RevokedClient[] = []
@minValue(2)
@maxValue(2)
param systemNodeCount int = 2
@minValue(1)
@maxValue(2)
param userNodeCount int = 1

var tags = { environment: 'poc', workload: 'ama', workPackage: 'WP-001', owner: 'paverboo', costCenter: '10122' }
var addressPlan AddressPlan = {
  vnetCidr: '10.83.0.0/20'
  systemSubnetCidr: '10.83.0.0/24'
  userSubnetCidr: '10.83.1.0/24'
  ingressSubnetCidr: '10.83.2.0/27'
  privateEndpointsSubnetCidr: '10.83.2.32/27'
  dnsInboundSubnetCidr: '10.83.2.64/28'
  gatewaySubnetCidr: '10.83.3.0/27'
  firewallSubnetCidr: '10.83.4.0/26'
  podCidr: '172.25.0.0/20'
  serviceCidr: '172.26.0.0/24'
  dnsServiceIp: '172.26.0.10'
  vpnClientCidr: '172.27.83.0/27'
  dnsInboundConfiguredIp: '10.83.2.68'
}
var groupNames = ['rg-ama-poc-sec-platform', 'rg-ama-poc-sec-aks']
module groups 'br/public:avm/res/resources/resource-group:0.4.4' = [for name in groupNames: {
  name: name
  params: { name: name, location: location, tags: tags, enableTelemetry: false }
}]
module identities './modules/identities.bicep' = {
  name: 'identities'
  scope: resourceGroup(groupNames[0])
  params: { location: location, tags: tags }
  dependsOn: [groups]
}
module monitoring './modules/monitoring-base.bicep' = {
  name: 'monitoring-base'
  scope: resourceGroup(groupNames[0])
  params: {
    location: location
    tags: tags
    observerPrincipalId: observerPrincipalId
    observerPrincipalType: observerPrincipalType
    alertEmail: alertEmail
  }
  dependsOn: [groups]
}
module connectivity './modules/connectivity.bicep' = {
  name: 'connectivity'
  scope: resourceGroup(groupNames[0])
  params: {
    location: location
    tags: tags
    addressPlan: addressPlan
    controlPlanePrincipalId: identities.outputs.controlPlane.principalId
    workspaceResourceId: monitoring.outputs.workspaceResourceId
    vpnRoots: vpnRoots
    vpnRevokedClients: vpnRevokedClients
  }
}
module services './modules/services.bicep' = {
  name: 'services'
  scope: resourceGroup(groupNames[0])
  params: {
    location: location
    tags: tags
    tenantId: tenantId
    peSubnetId: connectivity.outputs.subnetIds.privateEndpoints
    acrZoneId: connectivity.outputs.zoneIds.acr
    vaultZoneId: connectivity.outputs.zoneIds.vault
    kubeletPrincipalId: identities.outputs.kubelet.principalId
    workspaceResourceId: monitoring.outputs.workspaceResourceId
  }
}
module aks './modules/aks.bicep' = {
  name: 'aks'
  scope: resourceGroup(groupNames[1])
  params: {
    location: location
    tags: tags
    tenantId: tenantId
    version: kubernetesVersion
    sshPublicKey: sshPublicKey
    subnetIds: connectivity.outputs.subnetIds
    aksZoneId: connectivity.outputs.zoneIds.aks
    controlPlane: identities.outputs.controlPlane
    kubelet: identities.outputs.kubelet
    workspaceResourceId: monitoring.outputs.workspaceResourceId
    systemNodeCount: systemNodeCount
    userNodeCount: userNodeCount
  }
  // Cluster does not consume ACR endpoints; wait for AcrPull/PE/DNS completion.
  dependsOn: [services, groups]
}
module clusterMonitoring './modules/monitoring-cluster.bicep' = {
  name: 'monitoring-cluster'
  scope: resourceGroup(groupNames[1])
  params: {
    clusterId: aks.outputs.resourceId
    workspaceResourceId: monitoring.outputs.workspaceResourceId
    location: location
    tags: tags
  }
}
module accessAndAlerts './modules/access-and-alerts.bicep' = {
  name: 'access-and-alerts'
  params: {
    platformRgName: groupNames[0]
    aksRgName: groupNames[1]
    clusterId: aks.outputs.resourceId
    workspaceResourceId: monitoring.outputs.workspaceResourceId
    actionGroupId: monitoring.outputs.actionGroupId
    operatorPrincipalId: operatorPrincipalId
    observerPrincipalId: observerPrincipalId
    operatorPrincipalType: operatorPrincipalType
    observerPrincipalType: observerPrincipalType
    location: location
    tags: tags
  }
}

type FoundationInterfacesV2 = {
  platformRgId: string
  aksRgId: string
  clusterId: string
  poolIds: string[]
  nodeResourceGroupId: string
  vnetId: string
  subnetIds: SubnetIds
  zoneIds: ZoneIds
  privateEndpointIds: string[]
  registryId: string
  loginServer: string
  vaultId: string
  vaultUri: string
  privateFqdn: string
  oidcIssuerUrl: string
  controlPlane: ManagedIdentity
  kubelet: ManagedIdentity
  workspaceResourceId: string
  workspaceGuid: string
  dcrId: string
  actionGroupId: string
  dnsInboundConfiguredIp: string
}
output foundation FoundationInterfacesV2 = {
  platformRgId: groups[0].outputs.resourceId
  aksRgId: groups[1].outputs.resourceId
  clusterId: aks.outputs.resourceId
  poolIds: aks.outputs.poolIds
  nodeResourceGroupId: aks.outputs.nodeResourceGroupId
  vnetId: connectivity.outputs.vnetId
  subnetIds: connectivity.outputs.subnetIds
  zoneIds: connectivity.outputs.zoneIds
  privateEndpointIds: services.outputs.privateEndpointIds
  registryId: services.outputs.registryId
  loginServer: services.outputs.loginServer
  vaultId: services.outputs.vaultId
  vaultUri: services.outputs.vaultUri
  privateFqdn: aks.outputs.privateFqdn
  oidcIssuerUrl: aks.outputs.oidcIssuerUrl
  controlPlane: identities.outputs.controlPlane
  kubelet: identities.outputs.kubelet
  workspaceResourceId: monitoring.outputs.workspaceResourceId
  workspaceGuid: monitoring.outputs.workspaceGuid
  dcrId: clusterMonitoring.outputs.dcrId
  actionGroupId: monitoring.outputs.actionGroupId
  dnsInboundConfiguredIp: connectivity.outputs.dnsInboundConfiguredIp
}
