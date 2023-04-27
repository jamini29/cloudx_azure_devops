# cloudx_azure_devops







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





https://learn.microsoft.com/en-us/azure/app-service/tutorial-multi-region-app
https://learn.microsoft.com/en-us/azure/traffic-manager/quickstart-create-traffic-manager-profile-cli
https://github.com/MicrosoftDocs/azure-docs/blob/main/articles/traffic-manager/quickstart-create-traffic-manager-profile-cli.md
https://learn.microsoft.com/en-us/azure/app-service/overview-managed-identity?tabs=cli%2Chttp

