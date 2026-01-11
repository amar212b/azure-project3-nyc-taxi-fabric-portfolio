targetScope = 'resourceGroup'

param location string = 'westeurope'
param workspaceName string = 'nyc-taxi-fabric-ws'
param storageAccountName string = 'nyctaxistorage${uniqueString(resourceGroup().id)}'  // Auto-generated name

// Create ADLS Gen2 storage account first
resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
  properties: {
    isHnsEnabled: true  // Hierarchical namespace required for Fabric
  }
}

// Create Fabric/Synapse workspace with default storage
resource fabricWs 'Microsoft.Synapse/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
  identity: { type: 'SystemAssigned' }
  properties: {
    defaultDataLakeStorage: {
      accountUrl: storage.properties.primaryEndpoints.dfs
      filesystem: 'default'  // Default file system
    }
  }
}

output workspaceName string = fabricWs.name
output storageAccountName string = storage.name
