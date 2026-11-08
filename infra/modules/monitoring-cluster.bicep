param clusterId string
param workspaceResourceId string
param location string
param tags object

var streams = [
  'Microsoft-KubeNodeInventory'
  'Microsoft-KubePodInventory'
  'Microsoft-KubeEvents'
  'Microsoft-KubeMonAgentEvents'
  'Microsoft-Perf'
]

module collectionRule 'br/public:avm/res/insights/data-collection-rule:0.11.0' = {
  name: 'container-insights-rule'
  params: {
    name: 'MSCI-swedencentral-aks-ama-poc-sec'
    location: location
    tags: tags
    enableTelemetry: false
    dataCollectionRuleProperties: {
      kind: 'Linux'
      dataSources: {
        extensions: [
          {
            name: 'ContainerInsightsExtension'
            extensionName: 'ContainerInsights'
            streams: streams
            extensionSettings: {
              dataCollectionSettings: {
                interval: '1m'
                namespaceFilteringMode: 'Off'
                namespaces: []
                enableContainerLogV2: true
              }
            }
          }
        ]
      }
      destinations: {
        logAnalytics: [{ name: 'ciworkspace', workspaceResourceId: workspaceResourceId }]
      }
      dataFlows: [{ streams: streams, destinations: ['ciworkspace'] }]
    }
  }
}

resource cluster 'Microsoft.ContainerService/managedClusters@2026-03-01' existing = {
  name: last(split(clusterId, '/'))
}
resource association 'Microsoft.Insights/dataCollectionRuleAssociations@2023-03-11' = {
  scope: cluster
  name: 'ContainerInsightsExtension'
  properties: { dataCollectionRuleId: collectionRule.outputs.resourceId }
}

output dcrId string = collectionRule.outputs.resourceId
output associationId string = association.id
