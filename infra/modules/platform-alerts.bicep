param clusterId string
param workspaceResourceId string
param actionGroupId string
param platformRgId string
param aksRgId string
param location string
param tags object

var alerts = [
  {
    name: 'al-ama-poc-sec-node'
    query: 'KubeNodeInventory | where TimeGenerated > ago(10m) | where _ResourceId =~ \'${clusterId}\' | summarize arg_max(TimeGenerated, Status) by Computer | where Status !~ \'Ready\''
    periods: 2
  }
  {
    name: 'al-ama-poc-sec-events'
    query: 'KubeEvents | where TimeGenerated > ago(10m) | where _ResourceId =~ \'${clusterId}\' | where KubeEventType == \'Warning\' and Reason in (\'FailedScheduling\',\'Failed\',\'BackOff\',\'FailedMount\') | project TimeGenerated, Reason'
    periods: 1
  }
]
module logAlerts 'br/public:avm/res/insights/scheduled-query-rule:0.6.0' = [for alert in alerts: {
  name: alert.name
  params: {
    name: alert.name
    location: location
    tags: tags
    enableTelemetry: false
    enabled: true
    autoMitigate: true
    scopes: [workspaceResourceId]
    severity: 2
    evaluationFrequency: 'PT5M'
    windowSize: 'PT10M'
    skipQueryValidation: false
    actions: { actionGroupResourceIds: [actionGroupId] }
    criterias: {
      allOf: [
        {
          query: alert.query
          timeAggregation: 'Count'
          operator: 'GreaterThan'
          threshold: 0
          failingPeriods: { numberOfEvaluationPeriods: alert.periods, minFailingPeriodsToAlert: alert.periods }
        }
      ]
    }
  }
}]
module failedArm 'br/public:avm/res/insights/activity-log-alert:0.4.2' = {
  name: 'failed-arm-alert'
  params: {
    name: 'al-ama-poc-sec-failed-arm'
    location: 'global'
    tags: tags
    enableTelemetry: false
    enabled: true
    scopes: [platformRgId, aksRgId]
    conditions: [
      { field: 'category', equals: 'Administrative' }
      { field: 'level', equals: 'Error' }
    ]
    actions: [{ actionGroupId: actionGroupId }]
  }
}
output alertIds string[] = [logAlerts[0].outputs.resourceId, logAlerts[1].outputs.resourceId, failedArm.outputs.resourceId]
