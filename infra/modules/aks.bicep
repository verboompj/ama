import { ManagedIdentity } from './identities.bicep'
import { SubnetIds } from './connectivity.bicep'

param location string
param tags object
param tenantId string
param version string
param sshPublicKey string
param subnetIds SubnetIds
param aksZoneId string
param controlPlane ManagedIdentity
param kubelet ManagedIdentity
param workspaceResourceId string
@minValue(2)
@maxValue(2)
param systemNodeCount int
@minValue(1)
@maxValue(2)
param userNodeCount int

resource cluster 'Microsoft.ContainerService/managedClusters@2026-03-01' = {
  name: 'aks-ama-poc-sec'
  location: location
  tags: tags
  sku: { name: 'Base', tier: 'Standard' }
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: { '${controlPlane.resourceId}': {} }
  }
  properties: {
    supportPlan: 'KubernetesOfficial'
    kubernetesVersion: version
    nodeResourceGroup: 'rg-ama-poc-sec-aksnodes'
    nodeProvisioningProfile: { mode: 'Manual' }
    enableRBAC: true
    disableLocalAccounts: true
    publicNetworkAccess: 'Disabled'
    aadProfile: { managed: true, enableAzureRBAC: true, tenantID: tenantId }
    apiServerAccessProfile: {
      enablePrivateCluster: true
      enablePrivateClusterPublicFQDN: false
      enableVnetIntegration: false
      privateDNSZone: aksZoneId
    }
    identityProfile: {
      kubeletidentity: {
        resourceId: kubelet.resourceId
        clientId: kubelet.clientId
        objectId: kubelet.principalId
      }
    }
    linuxProfile: {
      adminUsername: 'azureuser'
      ssh: { publicKeys: [{ keyData: sshPublicKey }] }
    }
    networkProfile: {
      networkPlugin: 'azure'
      networkPluginMode: 'overlay'
      networkDataplane: 'cilium'
      networkPolicy: 'cilium'
      ipFamilies: ['IPv4']
      loadBalancerSku: 'standard'
      outboundType: 'userDefinedRouting'
      podCidr: '172.25.0.0/20'
      serviceCidr: '172.26.0.0/24'
      dnsServiceIP: '172.26.0.10'
    }
    oidcIssuerProfile: { enabled: true }
    securityProfile: { workloadIdentity: { enabled: true } }
    ingressProfile: {
      gatewayAPI: { installation: 'Standard' }
      webAppRouting: { gatewayAPIImplementations: { appRoutingIstio: { mode: 'Enabled' } } }
    }
    workloadAutoScalerProfile: { keda: { enabled: true } }
    addonProfiles: {
      azurepolicy: { enabled: true }
      azureKeyvaultSecretsProvider: {
        enabled: true
        config: { enableSecretRotation: 'true', rotationPollInterval: '2m' }
      }
      omsagent: {
        enabled: true
        config: { logAnalyticsWorkspaceResourceID: workspaceResourceId, useAADAuth: 'true' }
      }
    }
    autoUpgradeProfile: { upgradeChannel: 'patch', nodeOSUpgradeChannel: 'NodeImage' }
    storageProfile: {
      diskCSIDriver: { enabled: false }
      fileCSIDriver: { enabled: false }
      blobCSIDriver: { enabled: false }
      snapshotController: { enabled: false }
    }
    agentPoolProfiles: [for pool in [
      { name: 'sys', mode: 'System', vmSize: 'Standard_D4as_v5', count: systemNodeCount, min: 2, max: 2, subnet: subnetIds.system, workload: 'system', taints: ['CriticalAddonsOnly=true:NoSchedule'] }
      { name: 'usr', mode: 'User', vmSize: 'Standard_D2as_v5', count: userNodeCount, min: 1, max: 2, subnet: subnetIds.user, workload: 'user', taints: [] }
    ]: {
      name: pool.name
      mode: pool.mode
      vmSize: pool.vmSize
      count: pool.count
      minCount: pool.min
      maxCount: pool.max
      enableAutoScaling: true
      vnetSubnetID: pool.subnet
      type: 'VirtualMachineScaleSets'
      osType: 'Linux'
      osSKU: 'AzureLinux3'
      scaleSetPriority: 'Regular'
      availabilityZones: ['1']
      maxPods: 50
      enableNodePublicIP: false
      osDiskType: 'Managed'
      osDiskSizeGB: 128
      nodeTaints: pool.taints
      nodeLabels: { workload: pool.workload }
      orchestratorVersion: version
      tags: tags
      upgradeSettings: { maxSurge: '1', drainTimeoutInMinutes: 30, nodeSoakDurationInMinutes: 5 }
    }]
  }
}

resource maintenance 'Microsoft.ContainerService/managedClusters/maintenanceConfigurations@2025-10-01' = [for name in [
  'aksManagedAutoUpgradeSchedule'
  'aksManagedNodeOSUpgradeSchedule'
]: {
  parent: cluster
  name: name
  properties: {
    maintenanceWindow: {
      schedule: { weekly: { intervalWeeks: 1, dayOfWeek: 'Saturday' } }
      durationHours: 4
      utcOffset: '+00:00'
      startTime: '06:00'
    }
  }
}]

resource diagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  scope: cluster
  name: 'diag-ama-poc-sec-aks'
  properties: {
    workspaceId: workspaceResourceId
    logAnalyticsDestinationType: 'Dedicated'
    logs: [
      { category: 'kube-audit-admin', enabled: true }
      { category: 'cluster-autoscaler', enabled: true }
    ]
    metrics: []
  }
}

output resourceId string = cluster.id
output name string = cluster.name
output privateFqdn string = cluster.properties.privateFQDN
output oidcIssuerUrl string = cluster.properties.oidcIssuerProfile.issuerURL
output nodeResourceGroupId string = subscriptionResourceId('Microsoft.Resources/resourceGroups', 'rg-ama-poc-sec-aksnodes')
output poolIds string[] = [for name in ['sys', 'usr']: '${cluster.id}/agentPools/${name}']
output controlPlanePrincipalId string = controlPlane.principalId
