targetScope = 'resourceGroup'  // ← Change to this

param location string = 'westeurope'
param workspaceName string = 'nyc-taxi-fabric-ws'

resource fabricWs 'Microsoft.Synapse/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
  identity: { type: 'SystemAssigned' }
  properties: {}
}

output workspaceName string = fabricWs.name
