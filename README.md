# cloudx_azure_devops



- [What is Traffic Manager?](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-overview)
- [Traffic Manager Frequently Asked Questions ](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-faqs)
- [App Service overview](https://docs.microsoft.com/en-us/azure/app-service/overview)
- [Azure Key Vault basic concepts](https://docs.microsoft.com/en-us/azure/key-vault/general/basic-concepts)



### task
- Create Azure App Service Plans with Azure App Services under East US and Central US. Build highly available load balancer
infrastructure, with the lowest latency solution, based on Traffic Manager.
- Create Azure key vault service.
- Create Azure SQL database in East US and put the connection string in Azure key vault.


### details
- For granting access to key vault from the web app. In each webapp the managed identity feature should be enabled. In the
key vault please configure access policy based on the web app names.
- For the key vault secret please use the naming pattern <name_surname_1>. Key vault secret should store the connection
string for the Azure SQL database.
- For connecting frontend app with the backend,  please add “new application setting” in webapp configuration section, one
per each web app. Please use next string as setting value:  
`@Microsoft.KeyVault(VaultName=<YourKeyVaultName>;SecretName=<name_surname_1>;SecretVersion=)`
- In Traffic Manager use web apps as backends and specify the correct routing method as per the task description.



### useful links

- [Manage Azure Resource Groups by using Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-cli)


- [Tutorial: Create a highly available multi-region app in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/tutorial-multi-region-app)
  - <https://learn.microsoft.com/en-us/azure/architecture/high-availability/reference-architecture-traffic-manager-application-gateway>
  - <https://learn.microsoft.com/en-us/cli/azure/webapp/config/appsettings?view=azure-cli-latest#az-webapp-config-appsettings-set>
  - <https://learn.microsoft.com/en-us/cli/azure/webapp/identity?view=azure-cli-latest>
  - <https://learn.microsoft.com/en-us/cli/azure/appservice/plan?view=azure-cli-latest#az-appservice-plan-create>
  - <https://learn.microsoft.com/en-us/cli/azure/webapp?view=azure-cli-latest#az-webapp-create>
- [Quickstart: Create a Traffic Manager profile for a highly available web application using Azure CLI](https://learn.microsoft.com/en-us/azure/traffic-manager/quickstart-create-traffic-manager-profile-cli)
  - <https://github.com/MicrosoftDocs/azure-docs/blob/main/articles/traffic-manager/quickstart-create-traffic-manager-profile-cli.md>
  - <https://learn.microsoft.com/en-us/cli/azure/network/traffic-manager/profile?view=azure-cli-latest#az-network-traffic-manager-profile-create>
- [az network traffic-manager endpoint](https://learn.microsoft.com/en-us/cli/azure/network/traffic-manager/endpoint?view=azure-cli-latest#az-network-traffic-manager-endpoint-create)

- [Quickstart: Create a key vault using the Azure CLI](https://learn.microsoft.com/en-us/azure/key-vault/general/quick-create-cli)
- [How to use managed identities for App Service and Azure Functions](https://learn.microsoft.com/en-us/azure/app-service/overview-managed-identity?tabs=cli%2Chttp)
- [Quickstart: Set and retrieve a secret from Azure Key Vault using Azure CLI](https://learn.microsoft.com/en-us/azure/key-vault/secrets/quick-create-cli)
- [Assign a Key Vault access policy](https://learn.microsoft.com/en-us/azure/key-vault/general/assign-access-policy?tabs=azure-cli)
  - <https://learn.microsoft.com/en-us/cli/azure/keyvault?view=azure-cli-latest#az-keyvault-set-policy>
- [Quickstart: Create a single database - Azure SQL Database](https://learn.microsoft.com/en-us/azure/azure-sql/database/single-database-create-quickstart?view=azuresql&tabs=azure-cli)
  - <https://learn.microsoft.com/en-us/cli/azure/sql/db?view=azure-cli-latest#az-sql-db-create>
  - <https://learn.microsoft.com/en-us/azure/azure-sql/database/scripts/create-and-configure-database-cli?view=azuresql>
  
### read more

- <https://learn.microsoft.com/en-us/azure/app-service/tutorial-connect-msi-sql-database?tabs=cli%2Cef%2Cdotnet>

- [Use Azure portal to setup Continuous Delivery for Web App On Linux](https://devblogs.microsoft.com/devops/use-azure-portal-to-setup-continuous-delivery-for-web-app-on-linux/)
