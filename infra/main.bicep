targetScope = 'subscription'

param location string = 'westeurope'
param rgName string = 'nyc-taxi-rg'
param workspaceName string = 'nyc-taxi-fabric-ws'

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgName
  location: location
}

// Nested deployment for workspace (at resource group scope)
module workspace 'workspace.bicep' = {
  name: 'deployWorkspace'
  scope: rg
  params: {
    location: location
    workspaceName: workspaceName
  }
}

output workspaceName string = workspace.outputs.workspaceName
