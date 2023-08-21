az account show
AZ_RESOURCE_GROUP=azure-spring-workshop
AZ_DB_SERVER_NAME=msnirmal-mysql-server
AZ_LOCATION=eastus
AZ_MYSQL_USERNAME=spring
AZ_MYSQL_PASSWORD='6WAI24T4460G80X2$'
#The IP address of the local computer from which you'll run your Spring Boot application. To find the IP address, point your browser to whatismyip.akamai.com
AZ_LOCAL_IP_ADDRESS=170.37.238.16

echo $AZ_LOCAL_IP_ADDRESS

# Create Resource Group
#az group create  --name $AZ_RESOURCE_GROUP --location $AZ_LOCATION
az group create  --name $AZ_RESOURCE_GROUP --location $AZ_LOCATION |jq

# Create MySql Server (AZ Database for MySQL )
az mysql server create \
    --resource-group $AZ_RESOURCE_GROUP \
    --name $AZ_DB_SERVER_NAME \
    --location $AZ_LOCATION \
    --sku-name B_Gen5_1 \
    --storage-size 5120 \
    --admin-user $AZ_MYSQL_USERNAME \
    --admin-password $AZ_MYSQL_PASSWORD \
    | jq

#Can be added from portal "Connection security"
#Open server's firewall to local IP
az mysql server firewall-rule create \
    --resource-group $AZ_RESOURCE_GROUP \
    --name $AZ_DB_SERVER_NAME-database-allow-local-ip \
    --server-name $AZ_DB_SERVER_NAME \
    --start-ip-address $AZ_LOCAL_IP_ADDRESS \
    --end-ip-address $AZ_LOCAL_IP_ADDRESS \
    | jq

# allow firewall access from AZure resources
az mysql server firewall-rule create \
    --resource-group $AZ_RESOURCE_GROUP \
    --name $AZ_DB_SERVER_NAME-all-azure-IPs \
    --server-name $AZ_DB_SERVER_NAME \
    --start-ip-address 0.0.0.0 \
    --end-ip-address 0.0.0.0  \
    | jq

#Create database in mysql server
az mysql db create \
    --resource-group $AZ_RESOURCE_GROUP \
    --name demo \
    --server-name $AZ_DB_SERVER_NAME \
    | jq

#Generate the Spring aplication <<Generate from web>>
# curl https://start.spring.io/starter.tgz -d type=maven-project -d dependencies=web,data-jpa,mysql -d baseDir=azure-spring-workshop -d bootVersion=3.1.2 -d javaVersion=1.8

# Add a todo to the Spring application
curl --header "Content-Type: application/json" \
    --request POST \
    --data '{"description":"configuration","details":"congratulations, you have set up your Spring Boot application correctly!","done": "true"}' \
    http://127.0.0.1:8080

# Get the todos
curl --header "Content-Type: application/json" \
    --request GET \
    http://127.0.0.1:8080

# Add a todo to the Spring application
curl --header "Content-Type: application/json" \
    --request POST \
    --data '{"description":"configuration","details":"congratulations, you have set up your Spring Boot application correctly!","done": "true"}' \
    https://msnirmal.azurewebsites.net/

# Get the todos
curl --header "Content-Type: application/json" \
    --request GET \
    https://msnirmal.azurewebsites.net/

mvn com.microsoft.azure:azure-webapp-maven-plugin:2.12.0:config
mvn package com.microsoft.azure:azure-webapp-maven-plugin:2.12.0:deploy