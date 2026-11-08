param location string
param tags object
param observerPrincipalId string
param observerPrincipalType 'User' | 'Group'
param alertEmail string

module workspace 'br/public:avm/res/operational-insights/workspace:0.16.1' = {
  name: 'workspace'
  params: {
    name: 'law-ama-poc-sec'
    location: location
    tags: tags
    enableTelemetry: false
    skuName: 'PerGB2018'
    dataRetention: 31
    dailyQuotaGb: '1'
    forceCmkForQuery: false
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
    features: {
      disableLocalAuth: true
      enableDataExport: false
      enableLogAccessUsingOnlyResourcePermissions: false
    }
    roleAssignments: [
      {
        principalId: toLower(observerPrincipalId)
        principalType: observerPrincipalType
        roleDefinitionIdOrName: 'Log Analytics Reader'
      }
    ]
  }
}

module actionGroup 'br/public:avm/res/insights/action-group:0.8.0' = {
  name: 'action-group'
  params: {
    name: 'ag-ama-poc-sec-ops'
    groupShortName: 'amapoc'
    location: 'global'
    tags: tags
    enableTelemetry: false
    emailReceivers: [
      {
        name: 'operations'
        emailAddress: alertEmail
        useCommonAlertSchema: true
      }
    ]
  }
}

output workspaceResourceId string = workspace.outputs.resourceId
output workspaceGuid string = workspace.outputs.logAnalyticsWorkspaceId
output actionGroupId string = actionGroup.outputs.resourceId
