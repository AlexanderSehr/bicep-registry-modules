# Managed DevOps Pool `[Microsoft.DevOpsInfrastructure/pools]`

This module deploys the Managed DevOps Pool resource.

## Navigation

- [Resource Types](#Resource-Types)
- [Usage examples](#Usage-examples)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)
- [Notes](#Notes)
- [Data Collection](#Data-Collection)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/locks` | [2020-05-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2020-05-01/locks) |
| `Microsoft.Authorization/roleAssignments` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments) |
| `Microsoft.DevOpsInfrastructure/pools` | [2025-01-21](https://learn.microsoft.com/en-us/azure/templates/Microsoft.DevOpsInfrastructure/2025-01-21/pools) |
| `Microsoft.Insights/diagnosticSettings` | [2021-05-01-preview](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Insights/2021-05-01-preview/diagnosticSettings) |

## Usage examples

The following section provides usage examples for the module, which were used to validate and deploy the module successfully. For a full reference, please review the module's test folder in its repository.

>**Note**: Each example lists all the required parameters first, followed by the rest - each in alphabetical order.

>**Note**: To reference the module, please use the following syntax `br/public:avm/res/dev-ops-infrastructure/pool:<version>`.

- [All Week Schema](#example-1-all-week-schema)
- [Using only defaults](#example-2-using-only-defaults)
- [Using large parameter set](#example-3-using-large-parameter-set)
- [WAF-aligned](#example-4-waf-aligned)

### Example 1: _All Week Schema_

This instance deploys the module using an All-Week Scheme for the manual scaling prediction configuration.


<details>

<summary>via Bicep module</summary>

```bicep
module pool 'br/public:avm/res/dev-ops-infrastructure/pool:<version>' = {
  name: 'poolDeployment'
  params: {
    // Required parameters
    agentProfile: {
      kind: 'Stateless'
      resourcePredictions: {
        daysData: {
          allWeekScheme: {
            provisioningCount: 3
          }
        }
        timeZone: 'UTC'
      }
      resourcePredictionsProfile: {
        kind: 'Manual'
      }
    }
    concurrency: 1
    devCenterProjectResourceId: '<devCenterProjectResourceId>'
    fabricProfileSkuName: 'Standard_DS2_v2'
    images: [
      {
        wellKnownImageName: 'windows-2022/latest'
      }
    ]
    name: 'mdpwk001'
    organizationProfile: {
      kind: 'AzureDevOps'
      organizations: [
        {
          url: '<url>'
        }
      ]
    }
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "agentProfile": {
      "value": {
        "kind": "Stateless",
        "resourcePredictions": {
          "daysData": {
            "allWeekScheme": {
              "provisioningCount": 3
            }
          },
          "timeZone": "UTC"
        },
        "resourcePredictionsProfile": {
          "kind": "Manual"
        }
      }
    },
    "concurrency": {
      "value": 1
    },
    "devCenterProjectResourceId": {
      "value": "<devCenterProjectResourceId>"
    },
    "fabricProfileSkuName": {
      "value": "Standard_DS2_v2"
    },
    "images": {
      "value": [
        {
          "wellKnownImageName": "windows-2022/latest"
        }
      ]
    },
    "name": {
      "value": "mdpwk001"
    },
    "organizationProfile": {
      "value": {
        "kind": "AzureDevOps",
        "organizations": [
          {
            "url": "<url>"
          }
        ]
      }
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/dev-ops-infrastructure/pool:<version>'

// Required parameters
param agentProfile = {
  kind: 'Stateless'
  resourcePredictions: {
    daysData: {
      allWeekScheme: {
        provisioningCount: 3
      }
    }
    timeZone: 'UTC'
  }
  resourcePredictionsProfile: {
    kind: 'Manual'
  }
}
param concurrency = 1
param devCenterProjectResourceId = '<devCenterProjectResourceId>'
param fabricProfileSkuName = 'Standard_DS2_v2'
param images = [
  {
    wellKnownImageName: 'windows-2022/latest'
  }
]
param name = 'mdpwk001'
param organizationProfile = {
  kind: 'AzureDevOps'
  organizations: [
    {
      url: '<url>'
    }
  ]
}
```

</details>
<p>

### Example 2: _Using only defaults_

This instance deploys the module with the minimum set of required parameters.


<details>

<summary>via Bicep module</summary>

```bicep
module pool 'br/public:avm/res/dev-ops-infrastructure/pool:<version>' = {
  name: 'poolDeployment'
  params: {
    // Required parameters
    agentProfile: {
      kind: 'Stateless'
    }
    concurrency: 1
    devCenterProjectResourceId: '<devCenterProjectResourceId>'
    fabricProfileSkuName: 'Standard_DS2_v2'
    images: [
      {
        wellKnownImageName: 'windows-2022/latest'
      }
    ]
    name: 'mdpmin001'
    organizationProfile: {
      kind: 'AzureDevOps'
      organizations: [
        {
          url: '<url>'
        }
      ]
    }
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "agentProfile": {
      "value": {
        "kind": "Stateless"
      }
    },
    "concurrency": {
      "value": 1
    },
    "devCenterProjectResourceId": {
      "value": "<devCenterProjectResourceId>"
    },
    "fabricProfileSkuName": {
      "value": "Standard_DS2_v2"
    },
    "images": {
      "value": [
        {
          "wellKnownImageName": "windows-2022/latest"
        }
      ]
    },
    "name": {
      "value": "mdpmin001"
    },
    "organizationProfile": {
      "value": {
        "kind": "AzureDevOps",
        "organizations": [
          {
            "url": "<url>"
          }
        ]
      }
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/dev-ops-infrastructure/pool:<version>'

// Required parameters
param agentProfile = {
  kind: 'Stateless'
}
param concurrency = 1
param devCenterProjectResourceId = '<devCenterProjectResourceId>'
param fabricProfileSkuName = 'Standard_DS2_v2'
param images = [
  {
    wellKnownImageName: 'windows-2022/latest'
  }
]
param name = 'mdpmin001'
param organizationProfile = {
  kind: 'AzureDevOps'
  organizations: [
    {
      url: '<url>'
    }
  ]
}
```

</details>
<p>

### Example 3: _Using large parameter set_

This instance deploys the module with most of its features enabled.


<details>

<summary>via Bicep module</summary>

```bicep
module pool 'br/public:avm/res/dev-ops-infrastructure/pool:<version>' = {
  name: 'poolDeployment'
  params: {
    // Required parameters
    agentProfile: {
      kind: 'Stateless'
      resourcePredictions: {
        daysData: {
          friday: {
            endAgentCount: 0
            endTime: '17:00:00'
            startAgentCount: 1
            startTime: '09:00:00'
          }
          monday: {
            endAgentCount: 0
            endTime: '17:00:00'
            startAgentCount: 1
            startTime: '09:00:00'
          }
        }
        timeZone: 'UTC'
      }
      resourcePredictionsProfile: {
        kind: 'Manual'
      }
    }
    concurrency: 1
    devCenterProjectResourceId: '<devCenterProjectResourceId>'
    fabricProfileSkuName: 'Standard_D2_v2'
    images: [
      {
        aliases: [
          'windows-2022'
        ]
        buffer: '*'
        ephemeralType: 'Automatic'
        wellKnownImageName: 'windows-2022/latest'
      }
    ]
    name: 'mdpmax001'
    organizationProfile: {
      kind: 'AzureDevOps'
      organizations: [
        {
          openAccess: false
          parallelism: 1
          projects: [
            '<azureDevOpsProjectName>'
          ]
          url: '<url>'
        }
      ]
      permissionProfile: {
        kind: 'CreatorOnly'
      }
    }
    // Non-required parameters
    diagnosticSettings: [
      {
        eventHubAuthorizationRuleResourceId: '<eventHubAuthorizationRuleResourceId>'
        eventHubName: '<eventHubName>'
        metricCategories: [
          {
            category: 'AllMetrics'
          }
        ]
        name: 'customSetting'
        storageAccountResourceId: '<storageAccountResourceId>'
        workspaceResourceId: '<workspaceResourceId>'
      }
    ]
    location: '<location>'
    lock: {
      kind: 'CanNotDelete'
      name: 'myCustomLockName'
    }
    managedIdentities: {
      systemAssigned: false
      userAssignedResourceIds: [
        '<managedIdentityResourceId>'
      ]
    }
    roleAssignments: [
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: '<roleDefinitionIdOrName>'
      }
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
      {
        principalId: '<principalId>'
        principalType: 'ServicePrincipal'
        roleDefinitionIdOrName: 'Owner'
      }
    ]
    storageProfile: {
      dataDisks: [
        {
          caching: 'ReadWrite'
          diskSizeGiB: 100
          driveLetter: 'B'
          storageAccountType: 'Standard_LRS'
        }
      ]
      osDiskStorageAccountType: 'Standard'
    }
    subnetResourceId: '<subnetResourceId>'
    tags: {
      Environment: 'Non-Prod'
      'hidden-title': 'This is visible in the resource name'
      Role: 'DeploymentValidation'
    }
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "agentProfile": {
      "value": {
        "kind": "Stateless",
        "resourcePredictions": {
          "daysData": {
            "friday": {
              "endAgentCount": 0,
              "endTime": "17:00:00",
              "startAgentCount": 1,
              "startTime": "09:00:00"
            },
            "monday": {
              "endAgentCount": 0,
              "endTime": "17:00:00",
              "startAgentCount": 1,
              "startTime": "09:00:00"
            }
          },
          "timeZone": "UTC"
        },
        "resourcePredictionsProfile": {
          "kind": "Manual"
        }
      }
    },
    "concurrency": {
      "value": 1
    },
    "devCenterProjectResourceId": {
      "value": "<devCenterProjectResourceId>"
    },
    "fabricProfileSkuName": {
      "value": "Standard_D2_v2"
    },
    "images": {
      "value": [
        {
          "aliases": [
            "windows-2022"
          ],
          "buffer": "*",
          "ephemeralType": "Automatic",
          "wellKnownImageName": "windows-2022/latest"
        }
      ]
    },
    "name": {
      "value": "mdpmax001"
    },
    "organizationProfile": {
      "value": {
        "kind": "AzureDevOps",
        "organizations": [
          {
            "openAccess": false,
            "parallelism": 1,
            "projects": [
              "<azureDevOpsProjectName>"
            ],
            "url": "<url>"
          }
        ],
        "permissionProfile": {
          "kind": "CreatorOnly"
        }
      }
    },
    // Non-required parameters
    "diagnosticSettings": {
      "value": [
        {
          "eventHubAuthorizationRuleResourceId": "<eventHubAuthorizationRuleResourceId>",
          "eventHubName": "<eventHubName>",
          "metricCategories": [
            {
              "category": "AllMetrics"
            }
          ],
          "name": "customSetting",
          "storageAccountResourceId": "<storageAccountResourceId>",
          "workspaceResourceId": "<workspaceResourceId>"
        }
      ]
    },
    "location": {
      "value": "<location>"
    },
    "lock": {
      "value": {
        "kind": "CanNotDelete",
        "name": "myCustomLockName"
      }
    },
    "managedIdentities": {
      "value": {
        "systemAssigned": false,
        "userAssignedResourceIds": [
          "<managedIdentityResourceId>"
        ]
      }
    },
    "roleAssignments": {
      "value": [
        {
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "<roleDefinitionIdOrName>"
        },
        {
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "b24988ac-6180-42a0-ab88-20f7382dd24c"
        },
        {
          "principalId": "<principalId>",
          "principalType": "ServicePrincipal",
          "roleDefinitionIdOrName": "Owner"
        }
      ]
    },
    "storageProfile": {
      "value": {
        "dataDisks": [
          {
            "caching": "ReadWrite",
            "diskSizeGiB": 100,
            "driveLetter": "B",
            "storageAccountType": "Standard_LRS"
          }
        ],
        "osDiskStorageAccountType": "Standard"
      }
    },
    "subnetResourceId": {
      "value": "<subnetResourceId>"
    },
    "tags": {
      "value": {
        "Environment": "Non-Prod",
        "hidden-title": "This is visible in the resource name",
        "Role": "DeploymentValidation"
      }
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/dev-ops-infrastructure/pool:<version>'

// Required parameters
param agentProfile = {
  kind: 'Stateless'
  resourcePredictions: {
    daysData: {
      friday: {
        endAgentCount: 0
        endTime: '17:00:00'
        startAgentCount: 1
        startTime: '09:00:00'
      }
      monday: {
        endAgentCount: 0
        endTime: '17:00:00'
        startAgentCount: 1
        startTime: '09:00:00'
      }
    }
    timeZone: 'UTC'
  }
  resourcePredictionsProfile: {
    kind: 'Manual'
  }
}
param concurrency = 1
param devCenterProjectResourceId = '<devCenterProjectResourceId>'
param fabricProfileSkuName = 'Standard_D2_v2'
param images = [
  {
    aliases: [
      'windows-2022'
    ]
    buffer: '*'
    ephemeralType: 'Automatic'
    wellKnownImageName: 'windows-2022/latest'
  }
]
param name = 'mdpmax001'
param organizationProfile = {
  kind: 'AzureDevOps'
  organizations: [
    {
      openAccess: false
      parallelism: 1
      projects: [
        '<azureDevOpsProjectName>'
      ]
      url: '<url>'
    }
  ]
  permissionProfile: {
    kind: 'CreatorOnly'
  }
}
// Non-required parameters
param diagnosticSettings = [
  {
    eventHubAuthorizationRuleResourceId: '<eventHubAuthorizationRuleResourceId>'
    eventHubName: '<eventHubName>'
    metricCategories: [
      {
        category: 'AllMetrics'
      }
    ]
    name: 'customSetting'
    storageAccountResourceId: '<storageAccountResourceId>'
    workspaceResourceId: '<workspaceResourceId>'
  }
]
param location = '<location>'
param lock = {
  kind: 'CanNotDelete'
  name: 'myCustomLockName'
}
param managedIdentities = {
  systemAssigned: false
  userAssignedResourceIds: [
    '<managedIdentityResourceId>'
  ]
}
param roleAssignments = [
  {
    principalId: '<principalId>'
    principalType: 'ServicePrincipal'
    roleDefinitionIdOrName: '<roleDefinitionIdOrName>'
  }
  {
    principalId: '<principalId>'
    principalType: 'ServicePrincipal'
    roleDefinitionIdOrName: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
  }
  {
    principalId: '<principalId>'
    principalType: 'ServicePrincipal'
    roleDefinitionIdOrName: 'Owner'
  }
]
param storageProfile = {
  dataDisks: [
    {
      caching: 'ReadWrite'
      diskSizeGiB: 100
      driveLetter: 'B'
      storageAccountType: 'Standard_LRS'
    }
  ]
  osDiskStorageAccountType: 'Standard'
}
param subnetResourceId = '<subnetResourceId>'
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
```

</details>
<p>

### Example 4: _WAF-aligned_

This instance deploys the module in alignment with the best-practices of the Azure Well-Architected Framework.


<details>

<summary>via Bicep module</summary>

```bicep
module pool 'br/public:avm/res/dev-ops-infrastructure/pool:<version>' = {
  name: 'poolDeployment'
  params: {
    // Required parameters
    agentProfile: {
      kind: 'Stateless'
      resourcePredictionsProfile: {
        kind: 'Automatic'
        predictionPreference: 'Balanced'
      }
    }
    concurrency: 1
    devCenterProjectResourceId: '<devCenterProjectResourceId>'
    fabricProfileSkuName: 'Standard_D2_v2'
    images: [
      {
        ephemeralType: 'CacheDisk'
        wellKnownImageName: 'windows-2022/latest'
      }
    ]
    name: 'mdpwaf001'
    organizationProfile: {
      kind: 'AzureDevOps'
      organizations: [
        {
          openAccess: false
          parallelism: 1
          projects: [
            '<azureDevOpsProjectName>'
          ]
          url: '<url>'
        }
      ]
      permissionProfile: {
        kind: 'CreatorOnly'
      }
    }
    // Non-required parameters
    location: '<location>'
    subnetResourceId: '<subnetResourceId>'
  }
}
```

</details>
<p>

<details>

<summary>via JSON parameters file</summary>

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    // Required parameters
    "agentProfile": {
      "value": {
        "kind": "Stateless",
        "resourcePredictionsProfile": {
          "kind": "Automatic",
          "predictionPreference": "Balanced"
        }
      }
    },
    "concurrency": {
      "value": 1
    },
    "devCenterProjectResourceId": {
      "value": "<devCenterProjectResourceId>"
    },
    "fabricProfileSkuName": {
      "value": "Standard_D2_v2"
    },
    "images": {
      "value": [
        {
          "ephemeralType": "CacheDisk",
          "wellKnownImageName": "windows-2022/latest"
        }
      ]
    },
    "name": {
      "value": "mdpwaf001"
    },
    "organizationProfile": {
      "value": {
        "kind": "AzureDevOps",
        "organizations": [
          {
            "openAccess": false,
            "parallelism": 1,
            "projects": [
              "<azureDevOpsProjectName>"
            ],
            "url": "<url>"
          }
        ],
        "permissionProfile": {
          "kind": "CreatorOnly"
        }
      }
    },
    // Non-required parameters
    "location": {
      "value": "<location>"
    },
    "subnetResourceId": {
      "value": "<subnetResourceId>"
    }
  }
}
```

</details>
<p>

<details>

<summary>via Bicep parameters file</summary>

```bicep-params
using 'br/public:avm/res/dev-ops-infrastructure/pool:<version>'

// Required parameters
param agentProfile = {
  kind: 'Stateless'
  resourcePredictionsProfile: {
    kind: 'Automatic'
    predictionPreference: 'Balanced'
  }
}
param concurrency = 1
param devCenterProjectResourceId = '<devCenterProjectResourceId>'
param fabricProfileSkuName = 'Standard_D2_v2'
param images = [
  {
    ephemeralType: 'CacheDisk'
    wellKnownImageName: 'windows-2022/latest'
  }
]
param name = 'mdpwaf001'
param organizationProfile = {
  kind: 'AzureDevOps'
  organizations: [
    {
      openAccess: false
      parallelism: 1
      projects: [
        '<azureDevOpsProjectName>'
      ]
      url: '<url>'
    }
  ]
  permissionProfile: {
    kind: 'CreatorOnly'
  }
}
// Non-required parameters
param location = '<location>'
param subnetResourceId = '<subnetResourceId>'
```

</details>
<p>

## Parameters

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`agentProfile`](#parameter-agentprofile) | object | Defines how the machine will be handled once it executed a job. |
| [`concurrency`](#parameter-concurrency) | int | Defines how many resources can there be created at any given time. |
| [`devCenterProjectResourceId`](#parameter-devcenterprojectresourceid) | string | The resource id of the DevCenter Project the pool belongs to. |
| [`fabricProfileSkuName`](#parameter-fabricprofileskuname) | string | The Azure SKU name of the machines in the pool. |
| [`images`](#parameter-images) | array | The VM images of the machines in the pool. |
| [`name`](#parameter-name) | string | Name of the pool. It needs to be globally unique. |
| [`organizationProfile`](#parameter-organizationprofile) | object | Defines the organization in which the pool will be used. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`diagnosticSettings`](#parameter-diagnosticsettings) | array | The diagnostic settings of the service. |
| [`enableTelemetry`](#parameter-enabletelemetry) | bool | Enable/Disable usage telemetry for module. |
| [`location`](#parameter-location) | string | The geo-location where the resource lives. |
| [`lock`](#parameter-lock) | object | The lock settings of the service. |
| [`managedIdentities`](#parameter-managedidentities) | object | The managed service identities assigned to this resource. |
| [`osProfile`](#parameter-osprofile) | object | The OS profile of the agents in the pool. |
| [`roleAssignments`](#parameter-roleassignments) | array | Array of role assignments to create. |
| [`storageProfile`](#parameter-storageprofile) | object | The storage profile of the machines in the pool. |
| [`subnetResourceId`](#parameter-subnetresourceid) | string | The subnet id on which to put all machines created in the pool. |
| [`tags`](#parameter-tags) | object | Tags of the resource. |

### Parameter: `agentProfile`

Defines how the machine will be handled once it executed a job.

- Required: Yes
- Type: object
- Discriminator: `kind`

<h4>The available variants are:</h4>

| Variant | Description |
| :-- | :-- |
| [`Stateful`](#variant-agentprofilekind-stateful) | The type of a stateful agent profile. |
| [`Stateless`](#variant-agentprofilekind-stateless) | The type of a stateless agent profile. |

### Variant: `agentProfile.kind-Stateful`
The type of a stateful agent profile.

To use this variant, set the property `kind` to `Stateful`.

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`gracePeriodTimeSpan`](#parameter-agentprofilekind-statefulgraceperiodtimespan) | string | How long should the machine be kept around after it ran a workload when there are no stand-by agents. The maximum is one week. |
| [`kind`](#parameter-agentprofilekind-statefulkind) | string | Stateful profile meaning that the machines will be returned to the pool after running a job. |
| [`maxAgentLifetime`](#parameter-agentprofilekind-statefulmaxagentlifetime) | string | How long should stateful machines be kept around. The maximum is one week. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`resourcePredictions`](#parameter-agentprofilekind-statefulresourcepredictions) | object | Defines pool buffer/stand-by agents. |
| [`resourcePredictionsProfile`](#parameter-agentprofilekind-statefulresourcepredictionsprofile) | object | Determines how the stand-by scheme should be provided. |

### Parameter: `agentProfile.kind-Stateful.gracePeriodTimeSpan`

How long should the machine be kept around after it ran a workload when there are no stand-by agents. The maximum is one week.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.kind`

Stateful profile meaning that the machines will be returned to the pool after running a job.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Stateful'
  ]
  ```

### Parameter: `agentProfile.kind-Stateful.maxAgentLifetime`

How long should stateful machines be kept around. The maximum is one week.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions`

Defines pool buffer/stand-by agents.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`timeZone`](#parameter-agentprofilekind-statefulresourcepredictionstimezone) | string | The time zone in which the daysData is provided. To see the list of available time zones, see: https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-time-zones?view=windows-11#time-zones or via PowerShell command `(Get-TimeZone -ListAvailable).StandardName`. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`daysData`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdata) | object | The number of agents needed at a specific time. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.timeZone`

The time zone in which the daysData is provided. To see the list of available time zones, see: https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-time-zones?view=windows-11#time-zones or via PowerShell command `(Get-TimeZone -ListAvailable).StandardName`.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData`

The number of agents needed at a specific time.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allWeekScheme`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdataallweekscheme) | object | A schema to apply to the entire week (Machines available 24/7). Overrules the daily configurations. |
| [`friday`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatafriday) | object | The number of agents needed at a specific time for Friday. |
| [`monday`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatamonday) | object | The number of agents needed at a specific time for Monday. |
| [`saturday`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasaturday) | object | The number of agents needed at a specific time for Saturday. |
| [`sunday`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasunday) | object | The number of agents needed at a specific time for Sunday. |
| [`thursday`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatathursday) | object | The number of agents needed at a specific time for Thursday. |
| [`tuesday`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatatuesday) | object | The number of agents needed at a specific time for Tuesday. |
| [`wednesday`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatawednesday) | object | The number of agents needed at a specific time for Wednesday. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.allWeekScheme`

A schema to apply to the entire week (Machines available 24/7). Overrules the daily configurations.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`provisioningCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdataallweekschemeprovisioningcount) | int | The agent count to provision throughout the week. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.allWeekScheme.provisioningCount`

The agent count to provision throughout the week.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.friday`

The number of agents needed at a specific time for Friday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatafridayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatafridayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatafridaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatafridaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.friday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.friday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.friday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.friday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.monday`

The number of agents needed at a specific time for Monday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatamondayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatamondayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatamondaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatamondaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.monday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.monday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.monday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.monday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.saturday`

The number of agents needed at a specific time for Saturday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasaturdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasaturdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasaturdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasaturdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.saturday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.saturday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.saturday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.saturday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.sunday`

The number of agents needed at a specific time for Sunday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasundayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasundayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasundaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatasundaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.sunday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.sunday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.sunday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.sunday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.thursday`

The number of agents needed at a specific time for Thursday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatathursdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatathursdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatathursdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatathursdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.thursday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.thursday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.thursday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.thursday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.tuesday`

The number of agents needed at a specific time for Tuesday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatatuesdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatatuesdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatatuesdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatatuesdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.tuesday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.tuesday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.tuesday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.tuesday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.wednesday`

The number of agents needed at a specific time for Wednesday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatawednesdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatawednesdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatawednesdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statefulresourcepredictionsdaysdatawednesdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.wednesday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.wednesday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.wednesday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateful.resourcePredictions.daysData.wednesday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateful.resourcePredictionsProfile`

Determines how the stand-by scheme should be provided.

- Required: No
- Type: object
- Discriminator: `kind`

<h4>The available variants are:</h4>

| Variant | Description |
| :-- | :-- |
| [`Automatic`](#variant-agentprofilekind-statefulresourcepredictionsprofilekind-automatic) | The type of an automatic stand-by prediction profile. |
| [`Manual`](#variant-agentprofilekind-statefulresourcepredictionsprofilekind-manual) | The type of a manual stand-by prediction profile. |

### Variant: `agentProfile.kind-Stateful.resourcePredictionsProfile.kind-Automatic`
The type of an automatic stand-by prediction profile.

To use this variant, set the property `kind` to `Automatic`.

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-agentprofilekind-statefulresourcepredictionsprofilekind-automatickind) | string | The stand-by agent scheme is determined based on historical demand. |
| [`predictionPreference`](#parameter-agentprofilekind-statefulresourcepredictionsprofilekind-automaticpredictionpreference) | string | Determines the balance between cost and performance. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictionsProfile.kind-Automatic.kind`

The stand-by agent scheme is determined based on historical demand.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Automatic'
  ]
  ```

### Parameter: `agentProfile.kind-Stateful.resourcePredictionsProfile.kind-Automatic.predictionPreference`

Determines the balance between cost and performance.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Balanced'
    'BestPerformance'
    'MoreCostEffective'
    'MorePerformance'
    'MostCostEffective'
  ]
  ```

### Variant: `agentProfile.kind-Stateful.resourcePredictionsProfile.kind-Manual`
The type of a manual stand-by prediction profile.

To use this variant, set the property `kind` to `Manual`.

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-agentprofilekind-statefulresourcepredictionsprofilekind-manualkind) | string | Customer provides the stand-by agent scheme. |

### Parameter: `agentProfile.kind-Stateful.resourcePredictionsProfile.kind-Manual.kind`

Customer provides the stand-by agent scheme.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Manual'
  ]
  ```

### Variant: `agentProfile.kind-Stateless`
The type of a stateless agent profile.

To use this variant, set the property `kind` to `Stateless`.

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-agentprofilekind-statelesskind) | string | Stateless profile meaning that the machines will be cleaned up after running a job. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`resourcePredictions`](#parameter-agentprofilekind-statelessresourcepredictions) | object | Defines pool buffer/stand-by agents. |
| [`resourcePredictionsProfile`](#parameter-agentprofilekind-statelessresourcepredictionsprofile) | object | Determines how the stand-by scheme should be provided. |

### Parameter: `agentProfile.kind-Stateless.kind`

Stateless profile meaning that the machines will be cleaned up after running a job.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Stateless'
  ]
  ```

### Parameter: `agentProfile.kind-Stateless.resourcePredictions`

Defines pool buffer/stand-by agents.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`timeZone`](#parameter-agentprofilekind-statelessresourcepredictionstimezone) | string | The time zone in which the daysData is provided. To see the list of available time zones, see: https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-time-zones?view=windows-11#time-zones or via PowerShell command `(Get-TimeZone -ListAvailable).StandardName`. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`daysData`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdata) | object | The number of agents needed at a specific time. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.timeZone`

The time zone in which the daysData is provided. To see the list of available time zones, see: https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-time-zones?view=windows-11#time-zones or via PowerShell command `(Get-TimeZone -ListAvailable).StandardName`.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData`

The number of agents needed at a specific time.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`allWeekScheme`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdataallweekscheme) | object | A schema to apply to the entire week (Machines available 24/7). Overrules the daily configurations. |
| [`friday`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatafriday) | object | The number of agents needed at a specific time for Friday. |
| [`monday`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatamonday) | object | The number of agents needed at a specific time for Monday. |
| [`saturday`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasaturday) | object | The number of agents needed at a specific time for Saturday. |
| [`sunday`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasunday) | object | The number of agents needed at a specific time for Sunday. |
| [`thursday`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatathursday) | object | The number of agents needed at a specific time for Thursday. |
| [`tuesday`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatatuesday) | object | The number of agents needed at a specific time for Tuesday. |
| [`wednesday`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatawednesday) | object | The number of agents needed at a specific time for Wednesday. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.allWeekScheme`

A schema to apply to the entire week (Machines available 24/7). Overrules the daily configurations.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`provisioningCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdataallweekschemeprovisioningcount) | int | The agent count to provision throughout the week. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.allWeekScheme.provisioningCount`

The agent count to provision throughout the week.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.friday`

The number of agents needed at a specific time for Friday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatafridayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatafridayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatafridaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatafridaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.friday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.friday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.friday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.friday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.monday`

The number of agents needed at a specific time for Monday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatamondayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatamondayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatamondaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatamondaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.monday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.monday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.monday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.monday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.saturday`

The number of agents needed at a specific time for Saturday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasaturdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasaturdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasaturdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasaturdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.saturday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.saturday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.saturday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.saturday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.sunday`

The number of agents needed at a specific time for Sunday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasundayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasundayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasundaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatasundaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.sunday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.sunday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.sunday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.sunday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.thursday`

The number of agents needed at a specific time for Thursday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatathursdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatathursdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatathursdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatathursdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.thursday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.thursday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.thursday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.thursday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.tuesday`

The number of agents needed at a specific time for Tuesday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatatuesdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatatuesdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatatuesdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatatuesdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.tuesday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.tuesday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.tuesday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.tuesday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.wednesday`

The number of agents needed at a specific time for Wednesday.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`endAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatawednesdayendagentcount) | int | The number of agents needed at the end time. |
| [`endTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatawednesdayendtime) | string | The time at which the agents are no longer needed. |
| [`startAgentCount`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatawednesdaystartagentcount) | int | The number of agents needed at the start time. |
| [`startTime`](#parameter-agentprofilekind-statelessresourcepredictionsdaysdatawednesdaystarttime) | string | The time at which the agents are needed. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.wednesday.endAgentCount`

The number of agents needed at the end time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.wednesday.endTime`

The time at which the agents are no longer needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.wednesday.startAgentCount`

The number of agents needed at the start time.

- Required: Yes
- Type: int

### Parameter: `agentProfile.kind-Stateless.resourcePredictions.daysData.wednesday.startTime`

The time at which the agents are needed.

- Required: Yes
- Type: string

### Parameter: `agentProfile.kind-Stateless.resourcePredictionsProfile`

Determines how the stand-by scheme should be provided.

- Required: No
- Type: object
- Discriminator: `kind`

<h4>The available variants are:</h4>

| Variant | Description |
| :-- | :-- |
| [`Automatic`](#variant-agentprofilekind-statelessresourcepredictionsprofilekind-automatic) | The type of an automatic stand-by prediction profile. |
| [`Manual`](#variant-agentprofilekind-statelessresourcepredictionsprofilekind-manual) | The type of a manual stand-by prediction profile. |

### Variant: `agentProfile.kind-Stateless.resourcePredictionsProfile.kind-Automatic`
The type of an automatic stand-by prediction profile.

To use this variant, set the property `kind` to `Automatic`.

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-agentprofilekind-statelessresourcepredictionsprofilekind-automatickind) | string | The stand-by agent scheme is determined based on historical demand. |
| [`predictionPreference`](#parameter-agentprofilekind-statelessresourcepredictionsprofilekind-automaticpredictionpreference) | string | Determines the balance between cost and performance. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictionsProfile.kind-Automatic.kind`

The stand-by agent scheme is determined based on historical demand.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Automatic'
  ]
  ```

### Parameter: `agentProfile.kind-Stateless.resourcePredictionsProfile.kind-Automatic.predictionPreference`

Determines the balance between cost and performance.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Balanced'
    'BestPerformance'
    'MoreCostEffective'
    'MorePerformance'
    'MostCostEffective'
  ]
  ```

### Variant: `agentProfile.kind-Stateless.resourcePredictionsProfile.kind-Manual`
The type of a manual stand-by prediction profile.

To use this variant, set the property `kind` to `Manual`.

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-agentprofilekind-statelessresourcepredictionsprofilekind-manualkind) | string | Customer provides the stand-by agent scheme. |

### Parameter: `agentProfile.kind-Stateless.resourcePredictionsProfile.kind-Manual.kind`

Customer provides the stand-by agent scheme.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Manual'
  ]
  ```

### Parameter: `concurrency`

Defines how many resources can there be created at any given time.

- Required: Yes
- Type: int
- MinValue: 1
- MaxValue: 10000

### Parameter: `devCenterProjectResourceId`

The resource id of the DevCenter Project the pool belongs to.

- Required: Yes
- Type: string

### Parameter: `fabricProfileSkuName`

The Azure SKU name of the machines in the pool.

- Required: Yes
- Type: string

### Parameter: `images`

The VM images of the machines in the pool.

- Required: Yes
- Type: array

**Conditional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`resourceId`](#parameter-imagesresourceid) | string | The specific resource id of the marketplace or compute gallery image. Required if `wellKnownImageName` is not set. |
| [`wellKnownImageName`](#parameter-imageswellknownimagename) | string | The image to use from a well-known set of images made available to customers. Required if `resourceId` is not set. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`aliases`](#parameter-imagesaliases) | array | List of aliases to reference the image by. |
| [`buffer`](#parameter-imagesbuffer) | string | The percentage of the buffer to be allocated to this image. |
| [`ephemeralType`](#parameter-imagesephemeraltype) | string | The ephemeral type of the image. |

### Parameter: `images.resourceId`

The specific resource id of the marketplace or compute gallery image. Required if `wellKnownImageName` is not set.

- Required: No
- Type: string

### Parameter: `images.wellKnownImageName`

The image to use from a well-known set of images made available to customers. Required if `resourceId` is not set.

- Required: No
- Type: string

### Parameter: `images.aliases`

List of aliases to reference the image by.

- Required: No
- Type: array

### Parameter: `images.buffer`

The percentage of the buffer to be allocated to this image.

- Required: No
- Type: string

### Parameter: `images.ephemeralType`

The ephemeral type of the image.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Automatic'
    'CacheDisk'
    'ResourceDisk'
  ]
  ```

### Parameter: `name`

Name of the pool. It needs to be globally unique.

- Required: Yes
- Type: string

### Parameter: `organizationProfile`

Defines the organization in which the pool will be used.

- Required: Yes
- Type: object

### Parameter: `diagnosticSettings`

The diagnostic settings of the service.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`eventHubAuthorizationRuleResourceId`](#parameter-diagnosticsettingseventhubauthorizationruleresourceid) | string | Resource ID of the diagnostic event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to. |
| [`eventHubName`](#parameter-diagnosticsettingseventhubname) | string | Name of the diagnostic event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub. |
| [`logAnalyticsDestinationType`](#parameter-diagnosticsettingsloganalyticsdestinationtype) | string | A string indicating whether the export to Log Analytics should use the default destination type, i.e. AzureDiagnostics, or use a destination type. |
| [`logCategoriesAndGroups`](#parameter-diagnosticsettingslogcategoriesandgroups) | array | The name of logs that will be streamed. "allLogs" includes all possible logs for the resource. Set to `[]` to disable log collection. |
| [`marketplacePartnerResourceId`](#parameter-diagnosticsettingsmarketplacepartnerresourceid) | string | The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs. |
| [`metricCategories`](#parameter-diagnosticsettingsmetriccategories) | array | The name of metrics that will be streamed. "allMetrics" includes all possible metrics for the resource. Set to `[]` to disable metric collection. |
| [`name`](#parameter-diagnosticsettingsname) | string | The name of the diagnostic setting. |
| [`storageAccountResourceId`](#parameter-diagnosticsettingsstorageaccountresourceid) | string | Resource ID of the diagnostic storage account. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub. |
| [`workspaceResourceId`](#parameter-diagnosticsettingsworkspaceresourceid) | string | Resource ID of the diagnostic log analytics workspace. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub. |

### Parameter: `diagnosticSettings.eventHubAuthorizationRuleResourceId`

Resource ID of the diagnostic event hub authorization rule for the Event Hubs namespace in which the event hub should be created or streamed to.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.eventHubName`

Name of the diagnostic event hub within the namespace to which logs are streamed. Without this, an event hub is created for each log category. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.logAnalyticsDestinationType`

A string indicating whether the export to Log Analytics should use the default destination type, i.e. AzureDiagnostics, or use a destination type.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'AzureDiagnostics'
    'Dedicated'
  ]
  ```

### Parameter: `diagnosticSettings.logCategoriesAndGroups`

The name of logs that will be streamed. "allLogs" includes all possible logs for the resource. Set to `[]` to disable log collection.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-diagnosticsettingslogcategoriesandgroupscategory) | string | Name of a Diagnostic Log category for a resource type this setting is applied to. Set the specific logs to collect here. |
| [`categoryGroup`](#parameter-diagnosticsettingslogcategoriesandgroupscategorygroup) | string | Name of a Diagnostic Log category group for a resource type this setting is applied to. Set to `allLogs` to collect all logs. |
| [`enabled`](#parameter-diagnosticsettingslogcategoriesandgroupsenabled) | bool | Enable or disable the category explicitly. Default is `true`. |

### Parameter: `diagnosticSettings.logCategoriesAndGroups.category`

Name of a Diagnostic Log category for a resource type this setting is applied to. Set the specific logs to collect here.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.logCategoriesAndGroups.categoryGroup`

Name of a Diagnostic Log category group for a resource type this setting is applied to. Set to `allLogs` to collect all logs.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.logCategoriesAndGroups.enabled`

Enable or disable the category explicitly. Default is `true`.

- Required: No
- Type: bool

### Parameter: `diagnosticSettings.marketplacePartnerResourceId`

The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.metricCategories`

The name of metrics that will be streamed. "allMetrics" includes all possible metrics for the resource. Set to `[]` to disable metric collection.

- Required: No
- Type: array

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`category`](#parameter-diagnosticsettingsmetriccategoriescategory) | string | Name of a Diagnostic Metric category for a resource type this setting is applied to. Set to `AllMetrics` to collect all metrics. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`enabled`](#parameter-diagnosticsettingsmetriccategoriesenabled) | bool | Enable or disable the category explicitly. Default is `true`. |

### Parameter: `diagnosticSettings.metricCategories.category`

Name of a Diagnostic Metric category for a resource type this setting is applied to. Set to `AllMetrics` to collect all metrics.

- Required: Yes
- Type: string

### Parameter: `diagnosticSettings.metricCategories.enabled`

Enable or disable the category explicitly. Default is `true`.

- Required: No
- Type: bool

### Parameter: `diagnosticSettings.name`

The name of the diagnostic setting.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.storageAccountResourceId`

Resource ID of the diagnostic storage account. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub.

- Required: No
- Type: string

### Parameter: `diagnosticSettings.workspaceResourceId`

Resource ID of the diagnostic log analytics workspace. For security reasons, it is recommended to set diagnostic settings to send data to either storage account, log analytics workspace or event hub.

- Required: No
- Type: string

### Parameter: `enableTelemetry`

Enable/Disable usage telemetry for module.

- Required: No
- Type: bool
- Default: `True`

### Parameter: `location`

The geo-location where the resource lives.

- Required: No
- Type: string
- Default: `[resourceGroup().location]`

### Parameter: `lock`

The lock settings of the service.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`kind`](#parameter-lockkind) | string | Specify the type of lock. |
| [`name`](#parameter-lockname) | string | Specify the name of lock. |

### Parameter: `lock.kind`

Specify the type of lock.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'CanNotDelete'
    'None'
    'ReadOnly'
  ]
  ```

### Parameter: `lock.name`

Specify the name of lock.

- Required: No
- Type: string

### Parameter: `managedIdentities`

The managed service identities assigned to this resource.

- Required: No
- Type: object
- Example:
  ```Bicep
  {
    systemAssigned: true,
    userAssignedResourceIds: [
      '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myManagedIdentity'
    ]
  }
  {
    systemAssigned: true
  }
  ```

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`systemAssigned`](#parameter-managedidentitiessystemassigned) | bool | Enables system assigned managed identity on the resource. |
| [`userAssignedResourceIds`](#parameter-managedidentitiesuserassignedresourceids) | array | The resource ID(s) to assign to the resource. Required if a user assigned identity is used for encryption. |

### Parameter: `managedIdentities.systemAssigned`

Enables system assigned managed identity on the resource.

- Required: No
- Type: bool

### Parameter: `managedIdentities.userAssignedResourceIds`

The resource ID(s) to assign to the resource. Required if a user assigned identity is used for encryption.

- Required: No
- Type: array

### Parameter: `osProfile`

The OS profile of the agents in the pool.

- Required: No
- Type: object
- Default:
  ```Bicep
  {
      logonType: 'Interactive'
      secretsManagementSettings: {
        keyExportable: false
        observedCertificates: []
      }
  }
  ```

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`logonType`](#parameter-osprofilelogontype) | string | The logon type of the machine. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`secretsManagementSettings`](#parameter-osprofilesecretsmanagementsettings) | object | The secret management settings of the machines in the pool. |

### Parameter: `osProfile.logonType`

The logon type of the machine.

- Required: Yes
- Type: string
- Allowed:
  ```Bicep
  [
    'Interactive'
    'Service'
  ]
  ```

### Parameter: `osProfile.secretsManagementSettings`

The secret management settings of the machines in the pool.

- Required: No
- Type: object

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`keyExportable`](#parameter-osprofilesecretsmanagementsettingskeyexportable) | bool | The secret management settings of the machines in the pool. |
| [`observedCertificates`](#parameter-osprofilesecretsmanagementsettingsobservedcertificates) | array | The list of certificates to install on all machines in the pool. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`certificateStoreLocation`](#parameter-osprofilesecretsmanagementsettingscertificatestorelocation) | string | Where to store certificates on the machine. |
| [`certificateStoreName`](#parameter-osprofilesecretsmanagementsettingscertificatestorename) | string | Name of the certificate store to use on the machine. |

### Parameter: `osProfile.secretsManagementSettings.keyExportable`

The secret management settings of the machines in the pool.

- Required: Yes
- Type: bool

### Parameter: `osProfile.secretsManagementSettings.observedCertificates`

The list of certificates to install on all machines in the pool.

- Required: Yes
- Type: array

### Parameter: `osProfile.secretsManagementSettings.certificateStoreLocation`

Where to store certificates on the machine.

- Required: No
- Type: string

### Parameter: `osProfile.secretsManagementSettings.certificateStoreName`

Name of the certificate store to use on the machine.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'My'
    'Root'
  ]
  ```

### Parameter: `roleAssignments`

Array of role assignments to create.

- Required: No
- Type: array
- Roles configurable by name:
  - `'Contributor'`
  - `'Owner'`
  - `'Reader'`
  - `'Role Based Access Control Administrator'`
  - `'User Access Administrator'`

**Required parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`principalId`](#parameter-roleassignmentsprincipalid) | string | The principal ID of the principal (user/group/identity) to assign the role to. |
| [`roleDefinitionIdOrName`](#parameter-roleassignmentsroledefinitionidorname) | string | The role to assign. You can provide either the display name of the role definition, the role definition GUID, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`condition`](#parameter-roleassignmentscondition) | string | The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase "foo_storage_container". |
| [`conditionVersion`](#parameter-roleassignmentsconditionversion) | string | Version of the condition. |
| [`delegatedManagedIdentityResourceId`](#parameter-roleassignmentsdelegatedmanagedidentityresourceid) | string | The Resource Id of the delegated managed identity resource. |
| [`description`](#parameter-roleassignmentsdescription) | string | The description of the role assignment. |
| [`name`](#parameter-roleassignmentsname) | string | The name (as GUID) of the role assignment. If not provided, a GUID will be generated. |
| [`principalType`](#parameter-roleassignmentsprincipaltype) | string | The principal type of the assigned principal ID. |

### Parameter: `roleAssignments.principalId`

The principal ID of the principal (user/group/identity) to assign the role to.

- Required: Yes
- Type: string

### Parameter: `roleAssignments.roleDefinitionIdOrName`

The role to assign. You can provide either the display name of the role definition, the role definition GUID, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'.

- Required: Yes
- Type: string

### Parameter: `roleAssignments.condition`

The conditions on the role assignment. This limits the resources it can be assigned to. e.g.: @Resource[Microsoft.Storage/storageAccounts/blobServices/containers:ContainerName] StringEqualsIgnoreCase "foo_storage_container".

- Required: No
- Type: string

### Parameter: `roleAssignments.conditionVersion`

Version of the condition.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    '2.0'
  ]
  ```

### Parameter: `roleAssignments.delegatedManagedIdentityResourceId`

The Resource Id of the delegated managed identity resource.

- Required: No
- Type: string

### Parameter: `roleAssignments.description`

The description of the role assignment.

- Required: No
- Type: string

### Parameter: `roleAssignments.name`

The name (as GUID) of the role assignment. If not provided, a GUID will be generated.

- Required: No
- Type: string

### Parameter: `roleAssignments.principalType`

The principal type of the assigned principal ID.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
  ]
  ```

### Parameter: `storageProfile`

The storage profile of the machines in the pool.

- Required: No
- Type: object

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`dataDisks`](#parameter-storageprofiledatadisks) | array | A list of empty data disks to attach. |
| [`osDiskStorageAccountType`](#parameter-storageprofileosdiskstorageaccounttype) | string | The Azure SKU name of the machines in the pool. |

### Parameter: `storageProfile.dataDisks`

A list of empty data disks to attach.

- Required: No
- Type: array

**Optional parameters**

| Parameter | Type | Description |
| :-- | :-- | :-- |
| [`caching`](#parameter-storageprofiledatadiskscaching) | string | The type of caching to be enabled for the data disks. The default value for caching is readwrite. For information about the caching options see: https://blogs.msdn.microsoft.com/windowsazurestorage/2012/06/27/exploring-windows-azure-drives-disks-and-images/. |
| [`diskSizeGiB`](#parameter-storageprofiledatadisksdisksizegib) | int | The initial disk size in gigabytes. |
| [`driveLetter`](#parameter-storageprofiledatadisksdriveletter) | string | The drive letter for the empty data disk. If not specified, it will be the first available letter. Letters A, C, D, and E are not allowed. |
| [`storageAccountType`](#parameter-storageprofiledatadisksstorageaccounttype) | string | The storage Account type to be used for the data disk. If omitted, the default is Standard_LRS. |

### Parameter: `storageProfile.dataDisks.caching`

The type of caching to be enabled for the data disks. The default value for caching is readwrite. For information about the caching options see: https://blogs.msdn.microsoft.com/windowsazurestorage/2012/06/27/exploring-windows-azure-drives-disks-and-images/.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'None'
    'ReadOnly'
    'ReadWrite'
  ]
  ```

### Parameter: `storageProfile.dataDisks.diskSizeGiB`

The initial disk size in gigabytes.

- Required: No
- Type: int

### Parameter: `storageProfile.dataDisks.driveLetter`

The drive letter for the empty data disk. If not specified, it will be the first available letter. Letters A, C, D, and E are not allowed.

- Required: No
- Type: string

### Parameter: `storageProfile.dataDisks.storageAccountType`

The storage Account type to be used for the data disk. If omitted, the default is Standard_LRS.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Premium_LRS'
    'Premium_ZRS'
    'Standard_LRS'
    'StandardSSD_LRS'
    'StandardSSD_ZRS'
  ]
  ```

### Parameter: `storageProfile.osDiskStorageAccountType`

The Azure SKU name of the machines in the pool.

- Required: No
- Type: string
- Allowed:
  ```Bicep
  [
    'Premium'
    'Standard'
    'StandardSSD'
  ]
  ```

### Parameter: `subnetResourceId`

The subnet id on which to put all machines created in the pool.

- Required: No
- Type: string

### Parameter: `tags`

Tags of the resource.

- Required: No
- Type: object

## Outputs

| Output | Type | Description |
| :-- | :-- | :-- |
| `location` | string | The location the Managed DevOps Pool resource was deployed into. |
| `name` | string | The name of the Managed DevOps Pool. |
| `resourceGroupName` | string | The name of the resource group the Managed DevOps Pool resource was deployed into. |
| `resourceId` | string | The resource ID of the Managed DevOps Pool. |
| `systemAssignedMIPrincipalId` | string | The principal ID of the system assigned identity. |

## Cross-referenced modules

This section gives you an overview of all local-referenced module files (i.e., other modules that are referenced in this module) and all remote-referenced files (i.e., Bicep modules that are referenced from a Bicep Registry or Template Specs).

| Reference | Type |
| :-- | :-- |
| `br/public:avm/utl/types/avm-common-types:0.3.0` | Remote reference |

## Notes

The Managed DevOps Pool resource requires external permissions in Azure DevOps. Make sure that the deployment principal has permission in Azure DevOps: [Managed DevOps Pools - Verify Azure DevOps Permissions](https://learn.microsoft.com/en-us/azure/devops/managed-devops-pools/prerequisites?view=azure-devops&tabs=azure-portal#verify-azure-devops-permissions)

## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the [repository](https://aka.ms/avm/telemetry). There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
