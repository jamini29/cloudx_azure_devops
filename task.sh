#!/bin/bash

set -e

if ! az account show; then
  echo "### login to azure"
  az login --use-device-code
fi;

read -p "Do you want to proceed? (y/n)" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then exit 1; fi

let rnd=($RANDOM * $RANDOM);

rgName="aminich-rg-$rnd"

locationE="eastus"
locationW="westus"

appSpE="aminich-service-plan-eastus-$rnd"
appSpW="aminich-service-plan-westus-$rnd"
# if centralus region - create service plan returns error "This region has quota of 0 instances for your subscription. Try selecting different region or SKU." 

appE="aminich-app-eastus-$rnd"
appW="aminich-app-westus-$rnd"

tmProfile="aminich-trafic-manager-profile-$rnd"

epE="aminich-endpoint-eastus-$rnd"
epW="aminich-endpoint-westus-$rnd"

iDentity="aminich-identity-$rnd"

sqlServer="aminich-sql-server-$rnd"
dbName="aminich-db-name-$rnd"
dbLogin="aminich-db-login-$rnd"
# get password - just an example )
dbPass=$(openssl rand -base64 24)
dbPass="${dbPass//[^[:alnum:]]/#}"

kvName="aminich-kv-$rnd"
kvSecret="andrew-minich-1"

appSettingVariable="aminich_vault_dblink_secret"

#########################################
echo -e "\n--\nto clear all created resources run 'az group delete --name $rgName'\n--\n"

echo -e "\n### create group $rgName"
az group create --name $rgName --location $locationE

echo -e "\n### create app service plans $appSpE , $appSpW"
az appservice plan create --name $appSpE --resource-group $rgName --is-linux --location $locationE
az appservice plan create --name $appSpW --resource-group $rgName --is-linux --location $locationW

echo -e "\n### create web apps $appE , $appW"
az webapp create --name $appE --resource-group $rgName --plan $appSpE --runtime "NODE:18-lts"
az webapp create --name $appW --resource-group $rgName --plan $appSpW --runtime "NODE:18-lts"

echo -e "\n### get webapp hostnames, ids"
appEhost=$(az webapp show --name $appE --resource-group $rgName --query "hostNames" | jq -r .[0])
appWhost=$(az webapp show --name $appW --resource-group $rgName --query "hostNames" | jq -r .[0])

appEid=$(az webapp show --name $appE --resource-group $rgName --query id | jq -r .)
appWid=$(az webapp show --name $appW --resource-group $rgName --query id | jq -r .)

echo -e "hostnames:\n\t$appEhost\n\t$appWhost\nids:\n\t$appEid\n\t$appWid"

echo -e "\n### enable identity for web apps"
az webapp identity assign --resource-group $rgName --name $appE
az webapp identity assign --resource-group $rgName --name $appW

echo -e "\n### get web app identity principal ids"
princIdE=$(az webapp identity show --resource-group $rgName --name $appE --query principalId --output=json | jq -r .)
princIdW=$(az webapp identity show --resource-group $rgName --name $appW --query principalId --output=json | jq -r .)

echo -e "identity principal ids:\n\t$princIdE\n\t$princIdW"

echo -e "\n### create a traffic manager profile $tmProfile"
az network traffic-manager profile create --name $tmProfile --resource-group $rgName --routing-method Performance --path '/' --protocol "HTTP" --unique-dns-name $tmProfile --ttl 30 --port 80

echo -e "\n### get traffic manager dns name"
tmDnsName=$(az network traffic-manager profile show --name $tmProfile --resource-group $rgName --query dnsConfig.fqdn --output=json | jq -r .)
echo "traffic manager dns name: $tmDnsName"

echo -e "\n### create endpoints"
az network traffic-manager endpoint create --name $epE --resource-group $rgName --profile-name $tmProfile --type azureEndpoints --target-resource-id $appEid --endpoint-location $locationE --endpoint-status Enabled
az network traffic-manager endpoint create --name $epW --resource-group $rgName --profile-name $tmProfile --type azureEndpoints --target-resource-id $appWid --endpoint-location $locationW --endpoint-status Enabled

echo -e "\n### create sql server $sqlServer"
az sql server create --name $sqlServer --resource-group $rgName --location $locationE --admin-user $dbLogin --admin-password $dbPass

echo -e "\n### create db $dbName"
az sql db create --resource-group $rgName --server $sqlServer --name $dbName --edition GeneralPurpose --zone-redundant false

echo -e "\n### get connection string"
conn=$(az sql db show-connection-string --client ado.net --server $sqlServer --name $dbName --output=json | jq -r .)
conn=${conn/<username>/$dbLogin}
conn=${conn/<password>/$dbPass}

echo "db connection string: $conn"

echo -e "\n### create key vault $kvName"
az keyvault create --name $kvName --resource-group $rgName --location $locationE

echo -e "\n### give to web appa permission to get and list secrets"
az keyvault set-policy --name $kvName --object-id $princIdE --secret-permissions get list
az keyvault set-policy --name $kvName --object-id $princIdW --secret-permissions get list

echo -e "\n### add connection string to vault secret"
az keyvault secret set --vault-name $kvName --name $kvSecret --value "$conn"

echo -e "\n### check secret"
az keyvault secret show --name $kvSecret --vault-name $kvName --query "value"

echo -e "\n### get addition app settings value"
appSettings="@Microsoft.KeyVault(VaultName=$kvName;SecretName=$kvSecret;SecretVersion=)"

echo "app settings: $appSettings"

echo -e "\n### add setting to web apps"
az webapp config appsettings set --resource-group $rgName --name $appE --settings "$appSettingVariable"="$appSettings"
az webapp config appsettings set --resource-group $rgName --name $appW --settings "$appSettingVariable"="$appSettings"


echo -e "\n### check traffic manager configuration"
az network traffic-manager endpoint list --profile-name $tmProfile --resource-group $rgName

echo -e "\n### check app settings"
az webapp config appsettings list --name $appE --resource-group $rgName
az webapp config appsettings list --name $appW --resource-group $rgName


echo -e "\n--\nto clear all created resources run 'az group delete --name $rgName'"

# az keyvault purge -n aminich-kv

