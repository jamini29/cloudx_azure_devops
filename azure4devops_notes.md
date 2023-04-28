
## !

Azure Active Directory
Azure Storage
Azure Virtual Machines


tenant -> subscription -> resources|services

The inheritance order for scope in Azure is Management group, Subscription, Resource group, Resource.


single sign-on (SSO)
self-service password reset (SSPR)
The Azure AD account is also called a work or school account.
Azure AD implements HTTP and HTTPS protocols, such as SAML, WS-Federation, and OpenID Connect for authentication (and OAuth for authorization).

You can use an Azure AD account or a directory that's trusted by Azure AD like a work or school account. If you don't belong to one of these organizations, you can sign up for an Azure account by using your Microsoft Account, which is also trusted by Azure AD.


#### types of azure subscriptions

- Azure for free - includes a monetary credit to spend on any service for the first 30 days. You get free access to the most popular Azure products for 12 months, and access to more than 25 products that are always free.
- Azure paying monthly for used services. A Pay-As-You-Go (PAYG) subscription
- Enterprise agreement (EA subscription)
- Azure for students - includes a monetary credit that can be used within the first 12 months.

#### Management grops

root management group
up to six levels of depth

Azure Policy is a service in Azure that you can use to create, assign, and manage policies.

One or more policy definitions are grouped into an initiative definition

- create policy definition
- create initiative definition
- apply initiative definition to resources (resources can be grouped by management groups, subscriptions, resource groups)

#### role-based access control (RBAC)




#### ad users
 
```
# create a new user
az ad user create
# delete user
az ad user delete.
```

#### Azure Storage

Azure storage accounts have two tiers: Standard and Premium.

data services:
- Azure Blob Storage (containers): A massively scalable object store for text and binary data.
- Azure Files: Managed file shares for cloud or on-premises deployments.
- Azure Queue Storage: A messaging store for reliable messaging between application components (messages can be up to 64 KB in size)
- Azure Table Storage (Azure Cosmos DB): A NoSQL store for schemaless storage of structured data or relational data.

storage account types:
- Standard general-purpose v2: Blob Storage (including Data Lake Storage), Queue Storage, Table Storage, and Azure Files
- Premium block blobs: Blob Storage (including Data Lake Storage)
- Premium file shares: Azure Files
- Premium page blobs: Page blobs only

replication strategies:
- Locally redundant storage (LRS)
- Zone redundant storage (ZRS) - three storage clusters in a single region
- Geo-redundant storage (GRS/RA-GRS) - replicates your data three times locally then to a secondary region then three times remotely, RA-GRS is the default replication option
- Geo-zone-redundant storage (GZRS/RA-GZRS) - three Azure availability zones in the primary region, and also replicated to a secondary geographic region

Service           | Default endpoint
------------------|---
Container service | //mystorageaccount.blob.core.windows.net
Table service     | //mystorageaccount.table.core.windows.net
Queue service     | //mystorageaccount.queue.core.windows.net
File service      | //mystorageaccount.file.core.windows.net

custom domains:
- Direct mapping - CNAME record that points from the subdomain to the Azure storage account
  - Subdomain: `blobs.contoso.com`
  - Azure storage account: `\<storage account>\.blob.core.windows.net`
  - Direct CNAME record: `contosoblobs.blob.core.windows.net`
- Intermediary domain mapping - is applied to a domain that's already in use within Azure: to avoid downtime, you can use the `asverify` intermediary domain to validate the domain
  - CNAME record: `asverify.blobs.contoso.com`
  - Intermediate CNAME record: `asverify.contosoblobs.blob.core.windows.net`

The Firewalls and virtual networks settings restrict access to your storage account from specific subnets on virtual networks or public IPs.

#### Azure Blob Storage

Azure storage account -> Containers -> Blobs

- All blobs must be in a container.
- A container can store an unlimited number of blobs.
- An Azure storage account can contain an unlimited number of containers.
- Name: lowercase letters, numbers, and hyphens, 3-63 characters
- Container public access level:
  - Private: (Default)
  - Blob: allow anon access to blobs only
  - Container: allow anon access/list to entire container
  
#### Azure Storage security

Azure Storage security strategies:
- Encryption
- Authentication (AD, RBAC)
- Data in transit
- Disk encryption
- Shared access signatures
- Authorization

#### Azure Files

- file share
- file share snapshots
- Azure File Sync
  - Storage Sync Service
  - Sync group
  - Registered server
  - Azure File Sync agent
  - Server endpoint
  - Cloud endpoint
  
#### Azure Virtual Machines

- VM name: up to 15 characters on a Windows VM and 64 characters on a Linux
- subscription is billed two separate costs for every VM: compute and storage
  - Compute expenses: Consumption-based, Reserved Virtual Machine Instances (RI)
  - Storage costs are charged separately for the Azure Storage
- Sizing:
  - General purpose
  - Compute optimized
  - Memory optimized
  - Storage optimized
  - GPU
  - High performance computes
- All Azure virtual machines have at least two disks: an operating system disk and a temporary disk
- All disks are stored as virtual hard disks (VHDs). 
- The OS disk is registered as a SATA drive, tmp - IDK, Data disks are registered as SCSI drives



Azure Virtual Machine Scale Sets are an Azure Compute resource that you can use to deploy and manage a set of **identical** VM.
- update domains
- fault domains.

VM extensions

Custom Script Extensions only have 90 minutes timeout

#### Azure App Service 

Each App Service plan defines: Region, Number of VM instances, Size of VM instances.

deployment slots

#### Azure Container Instances

#### Azure Kubernetes Service (AKS)

Pools -> Nodes -Deployment/Manifest-> Pods -> Container
Deployment: A deployment has one or more identical pods managed by Kubernetes.
Manifest: The manifest is the YAML file that describes a deployment.

- Azure-managed nodes
- customer-managed nodes.

horizontal pod autoscaler (HPA)


#### Azure Automation State Configuration

PowerShell Desired State Configuration (DSC)
local configuration manager (LCM) - a component of the Windows Management Framework (WMF)





Azure Bastion | Azure Load Balancer

## simulation !
- https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/9-simulation-blobs
- https://learn.microsoft.com/en-us/training/modules/configure-virtual-machine-availability/11-simulation-machine-scale
- https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/11-simulation-web-apps
- https://learn.microsoft.com/en-us/training/modules/configure-azure-container-instances/6-simulation-containers
- https://learn.microsoft.com/en-us/training/modules/configure-azure-kubernetes-service/8-simulation-kubernetes
- https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/9-simulation-create-networks
- https://learn.microsoft.com/en-us/training/modules/configure-network-security-groups/7-simulation-create-network-groups
- https://learn.microsoft.com/en-us/training/modules/configure-vnet-peering/6-simulation-peering
- https://learn.microsoft.com/en-us/training/modules/configure-network-routing-endpoints/7-simulation-routing
- https://learn.microsoft.com/en-us/training/modules/configure-azure-load-balancer/9-simulation-load-balancer
- https://learn.microsoft.com/en-us/training/modules/configure-file-folder-backups/7-interactive-lab-simulation
- https://learn.microsoft.com/en-us/training/modules/configure-virtual-machine-backups/11-simulation-machine-backups
- https://learn.microsoft.com/en-us/training/modules/configure-azure-monitor/8-simulation-monitor
- https://learn.microsoft.com/en-us/training/modules/configure-log-analytics/4-visualize-data

## sandbox

- https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/3-exercise-add-delete-users-azure-ad
- https://learn.microsoft.com/en-us/training/modules/create-users-and-groups-in-azure-active-directory/7-exercise-guest-user-access-azure-ad-b2b
- https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/4-list-access
- https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/5-grant-access
- https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/6-view-activity-logs
- https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/4-exercise-set-up-self-service-password-reset
- https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/5-exercise-customize-directory-branding
- 
- https://learn.microsoft.com/en-us/training/modules/create-azure-storage-account/5-exercise-create-a-storage-account
- https://learn.microsoft.com/en-us/training/modules/control-access-to-azure-storage-with-sas/4-exercise-use-shared-access-signatures
- https://learn.microsoft.com/en-us/training/modules/control-access-to-azure-storage-with-sas/6-exercise-use-stored-access-policies
- https://learn.microsoft.com/en-us/training/modules/upload-download-and-manage-data-with-azure-storage-explorer/3-exercise-connect-storage-account
- https://learn.microsoft.com/en-us/training/modules/upload-download-and-manage-data-with-azure-storage-explorer/5-exercise-connect-cosmosdb-data-lake
- 
- https://learn.microsoft.com/en-us/training/modules/manage-virtual-machines-with-azure-cli/2-create-a-vm
- https://learn.microsoft.com/en-us/training/modules/manage-virtual-machines-with-azure-cli/3-testing-the-vm
- https://learn.microsoft.com/en-us/training/modules/manage-virtual-machines-with-azure-cli/4-other-vm-images
- https://learn.microsoft.com/en-us/training/modules/manage-virtual-machines-with-azure-cli/5-sizing-vms
- https://learn.microsoft.com/en-us/training/modules/manage-virtual-machines-with-azure-cli/6-querying-vms
- https://learn.microsoft.com/en-us/training/modules/manage-virtual-machines-with-azure-cli/7-managing-vms
- https://learn.microsoft.com/en-us/training/modules/manage-virtual-machines-with-azure-cli/8-installing-software
- 
- https://learn.microsoft.com/en-us/training/modules/create-windows-virtual-machine-in-azure/3-exercise-create-a-vm
- 
- https://learn.microsoft.com/en-us/training/modules/host-a-web-app-with-azure-app-service/3-exercise-create-a-web-app-in-the-azure-portal?pivots=csharp
- https://learn.microsoft.com/en-us/training/modules/host-a-web-app-with-azure-app-service/5-exercise-implement-a-web-application?pivots=node
- https://learn.microsoft.com/en-us/training/modules/host-a-web-app-with-azure-app-service/7-exercise-deploy-your-code-to-app-service?pivots=node
- 
- https://learn.microsoft.com/en-us/training/modules/protect-vm-settings-with-dsc/4-exercise-setup-dsc-configuration
- 
- https://learn.microsoft.com/en-us/training/modules/design-ip-addressing-for-azure/5-exercise-implement-vnets
- https://learn.microsoft.com/en-us/training/modules/integrate-vnets-with-vnet-peering/3-exercise-prepare-vnets-for-peering-using-azure-cli-commands
- https://learn.microsoft.com/en-us/training/modules/integrate-vnets-with-vnet-peering/4-exercise-configure-vnet-peering-connections-using-azure-cli-commands
- https://learn.microsoft.com/en-us/training/modules/integrate-vnets-with-vnet-peering/5-exercise-verify-vnet-peering
- 
- https://learn.microsoft.com/en-us/training/modules/host-domain-azure-dns/4-exercise-create-dns-zone-a-record
- https://learn.microsoft.com/en-us/training/modules/host-domain-azure-dns/6-exercise-create-alias-records
- 
- https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/3-exercise-create-custom-routes
- https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/5-exercise-create-nva-vm
- https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/6-exercise-route-traffic-through-nva
- 
- https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/4-exercise-configure-public-load-balancer?pivots=bash
- 
- https://learn.microsoft.com/en-us/training/modules/azure-sql-deploy-configure/6-exercise-configure-database
- https://learn.microsoft.com/en-us/training/modules/azure-sql-deploy-configure/8-exercise-load-data
- 
- https://learn.microsoft.com/en-us/training/modules/azure-sql-secure-data/3-exercise-configure-sql-database
- https://learn.microsoft.com/en-us/training/modules/azure-sql-secure-data/4-exercise-network-security
- https://learn.microsoft.com/en-us/training/modules/azure-sql-secure-data/5-exercise-configure-authentication
- https://learn.microsoft.com/en-us/training/modules/azure-sql-secure-data/8-exercise-advanced-data-security
- https://learn.microsoft.com/en-us/training/modules/azure-sql-secure-data/9-exercise-data-classification-masking-audit
- 
- https://learn.microsoft.com/en-us/training/modules/azure-sql-performance/5-exercise-monitor-troubleshoot-performance
- 
- https://learn.microsoft.com/en-us/training/modules/azure-sql-high-availability/3-exercise-restore-point-in-time
- https://learn.microsoft.com/en-us/training/modules/azure-sql-high-availability/5-exercise-general-purpose-high-availability
- https://learn.microsoft.com/en-us/training/modules/azure-sql-high-availability/6-exercise-business-critical-high-availability
- https://learn.microsoft.com/en-us/training/modules/azure-sql-high-availability/8-exercise-auto-failover-groups
- 
- https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/4-exercise-metric-alerts
- https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/7-exercise-activity-log-alerts
- 
- https://learn.microsoft.com/en-us/training/modules/analyze-infrastructure-with-azure-monitor-logs/4-exercise-create-log-queries
- https://learn.microsoft.com/en-us/training/modules/monitor-performance-using-azure-monitor-for-vms/3-exercise-set-up-log-analytics-workspace









---
:exclamation:

Any user can sign up for a free trial account. You can get started using Azure right away, and you won't be charged until you choose to upgrade.
https://azure.microsoft.com/free/
