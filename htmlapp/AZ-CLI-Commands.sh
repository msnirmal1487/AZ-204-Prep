az account clear
az login --allow-no-subscriptions
az account show
az group list
az group list --query "[].{id:name}" 
az group list --query "[].{id:name}" -o tsv
resourceGroup=$(az group list --query "[].{id:name}" -o tsv)
appName=az204app$RANDOM

echo $resourceGroup
echo $appName

cd html-docs-hello-world/

az webapp up -g $resourceGroup -n $appName --html