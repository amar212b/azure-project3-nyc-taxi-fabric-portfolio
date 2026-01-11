targetScope = 'resourceGroup'

param location string
param workspaceName string

resource fabricWs 'Microsoft.Synapse/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
  identity: { type: 'SystemAssigned' }
  properties: {}
}

output workspaceName string = fabricWs.name
