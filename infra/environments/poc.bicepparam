using '../main.bicep'

param tenantId = readEnvironmentVariable('AMA_TENANT_ID')
param operatorPrincipalId = readEnvironmentVariable('AMA_OPERATOR_PRINCIPAL_ID')
param observerPrincipalId = readEnvironmentVariable('AMA_OBSERVER_PRINCIPAL_ID')
param operatorPrincipalType = readEnvironmentVariable('AMA_OPERATOR_PRINCIPAL_TYPE')
param observerPrincipalType = readEnvironmentVariable('AMA_OBSERVER_PRINCIPAL_TYPE')
param sshPublicKey = readEnvironmentVariable('AMA_SSH_PUBLIC_KEY')
param alertEmail = readEnvironmentVariable('AMA_ALERT_EMAIL')
param vpnRoots = json(readEnvironmentVariable('AMA_VPN_ROOTS_JSON'))
param vpnRevokedClients = json(readEnvironmentVariable('AMA_VPN_REVOKED_CLIENTS_JSON'))
// Supply the approved current count explicitly; no unexamined replay default.
param userNodeCount = int(readEnvironmentVariable('AMA_USER_NODE_COUNT'))
